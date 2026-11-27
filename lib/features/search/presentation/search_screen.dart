import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/di/service_locator.dart';
import '../../../shared/extensions/build_context_extensions.dart';
import '../../../shared/presentation/widgets/app_drawer.dart';
import '../../../shared/presentation/widgets/error_view.dart';
import '../../auth/presentation/bloc/auth_cubit.dart';
import '../../track/domain/repositories/track_repository.dart';
import '../../track/presentation/widgets/track_tile.dart';
import 'bloc/search_cubit.dart';
import 'bloc/search_state.dart';
import 'widgets/search_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static const double _searchBarHeight = 56.0;
  static const double _searchBarPadding = 12.0;

  final _searchController = TextEditingController();
  final _focusNode = FocusNode();
  final _scrollController = ScrollController();

  bool get _isAtEnd {
    if (!_scrollController.hasClients) return false;
    final position = _scrollController.position;
    if (position.maxScrollExtent == 0) return false;
    return position.pixels == position.maxScrollExtent;
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onSubmitted(String query) {
    final trimmedQuery = query.trim();
    _searchController.text = trimmedQuery;

    if (trimmedQuery.isEmpty) {
      final state = context.read<SearchCubit>().state;

      if (state is! SearchLoaded) {
        _searchController.clear();
        return;
      }

      _searchController.text = state.query;
      return;
    }

    if (_scrollController.hasClients) _scrollController.jumpTo(0);
    context.read<SearchCubit>().search(trimmedQuery);
  }

  void _onCleared() {
    _searchController.clear();
    _focusNode.requestFocus();
  }

  void _onScroll() {
    if (_focusNode.hasFocus) _focusNode.unfocus();
    if (_isAtEnd) context.read<SearchCubit>().loadMore();
  }

  Future<void> _onTrackSelected(int trackId) async {
    try {
      final trackUrl = await locator<TrackRepository>().getDownloadUrl(trackId);
      await launchUrlString(trackUrl, mode: LaunchMode.externalApplication);
    } catch (_) {
      if (mounted) context.showSnackBar(context.l10n.trackOpenFailed);
    }
  }

  void _onLogOut() {
    Navigator.pop(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(context.l10n.logoutConfirmation),
          actions: [
            TextButton(
              onPressed: dialogContext.pop,
              child: Text(context.l10n.logoutCancel),
            ),
            FilledButton(
              onPressed: () {
                dialogContext.pop();
                context.read<AuthCubit>().logout();
              },
              child: Text(context.l10n.logoutConfirm),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(
            _searchBarHeight + _searchBarPadding,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: _searchBarPadding,
              right: _searchBarPadding,
              bottom: _searchBarPadding,
            ),
            child: SearchField(
              controller: _searchController,
              focusNode: _focusNode,
              onSubmitted: _onSubmitted,
              onCleared: _onCleared,
              hintText: context.l10n.searchHint,
              filled: true,
            ),
          ),
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          switch (state) {
            case SearchInitial():
              return const Center(
                child: Icon(Icons.music_note_outlined, size: 128.0),
              );
            case SearchLoading():
              return const Center(child: CircularProgressIndicator());
            case SearchLoaded(:final tracks):
              return ListView.separated(
                controller: _scrollController,
                itemCount: tracks.length + (state.hasReachedMax ? 0 : 1),
                itemBuilder: (context, index) {
                  final isFooterIndex = index == tracks.length;
                  if (isFooterIndex) return _PaginationFooter(state: state);

                  final track = tracks[index];
                  return TrackTile(
                    track: track,
                    onTap: () => _onTrackSelected(track.id),
                  );
                },
                separatorBuilder: (_, _) => const Divider(height: 8.0),
              );
            case SearchEmpty():
              return Center(
                child: ErrorView(message: context.l10n.nothingFound),
              );
            case SearchFailure(:final query):
              return Center(
                child: ErrorView(
                  message: context.l10n.errorTitle,
                  onRetry: () => _onSubmitted(query),
                ),
              );
          }
        },
      ),
      drawer: AppDrawer(
        children: [
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(context.l10n.logoutTitle),
            onTap: _onLogOut,
          ),
        ],
      ),
    );
  }
}

class _PaginationFooter extends StatelessWidget {
  const _PaginationFooter({required this.state});

  final SearchLoaded state;

  @override
  Widget build(BuildContext context) {
    if (state.isLoadingMore) {
      return const Padding(
        padding: EdgeInsets.all(26.0),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.hasError) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card.outlined(
          child: ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(context.l10n.errorTitle),
            trailing: FilledButton.icon(
              onPressed: () => context.read<SearchCubit>().loadMore(),
              icon: const Icon(Icons.refresh),
              label: Text(context.l10n.errorRetry),
            ),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
