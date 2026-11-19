import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/presentation/widgets/track_tile.dart';
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

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_focusNode.unfocus);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onSubmitted(String query) {
    if (query.trim().isEmpty) return;

    if (_scrollController.hasClients) _scrollController.jumpTo(0);
    context.read<SearchCubit>().search(query);
  }

  void _onCleared() {
    _searchController.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muzzify'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(_searchBarHeight + _searchBarPadding),
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
              hintText: 'Search tracks',
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
              return ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, index) {
                  final track = tracks[index];
                  return TrackTile(track: track);
                },
                itemCount: tracks.length,
              );
            case SearchEmpty():
              return const Center(child: Text('Nothing found'));
            case SearchFailure():
              return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}
