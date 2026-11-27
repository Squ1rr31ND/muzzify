import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/di/service_locator.dart';
import '../../../shared/presentation/widgets/app_drawer.dart';
import '../../../shared/presentation/widgets/error_view.dart';
import '../constants/auth_constants.dart';
import 'bloc/auth_cubit.dart';

class AuthScreen extends StatefulWidget {
  static const String _blankHtml = '<html></html>';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoading = true;

  bool _hasError = false;

  void _setLoading(bool isLoading) {
    if (!mounted || _hasError) return;
    setState(() => _isLoading = isLoading);
  }

  void _setError() {
    unawaited(_controller.loadHtmlString(AuthScreen._blankHtml));
    setState(() => _hasError = true);
  }

  void _resetError() {
    unawaited(_controller.loadRequest(AuthConstants.authorizeUri));
    setState(() => _hasError = false);
  }

  late final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: _onNavigationRequest,
        onPageStarted: (_) => _setLoading(true),
        onPageFinished: (_) => _setLoading(false),
        onWebResourceError: _onWebViewLoadError,
      ),
    )
    ..loadRequest(AuthConstants.authorizeUri);

  void _onWebViewLoadError(WebResourceError error) {
    if (!mounted) return;
    if (error.isForMainFrame != true) return;

    final isNetworkError = switch (error.errorType) {
      WebResourceErrorType.hostLookup ||
      WebResourceErrorType.connect ||
      WebResourceErrorType.timeout => true,
      _ => false,
    };

    if (isNetworkError) _setError();
  }

  FutureOr<NavigationDecision> _onNavigationRequest(
    NavigationRequest request,
  ) async {
    final url = request.url;

    if (!url.contains(AuthConstants.accessTokenKey)) {
      return NavigationDecision.navigate;
    }

    try {
      await locator<AuthCubit>().loginWithCallbackUrl(url);
    } catch (_) {
      if (!mounted) return NavigationDecision.prevent;
      _setError();
    }

    return NavigationDecision.prevent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Yandex ID')),
      body: _hasError
          ? Center(
              child: ErrorView(
                message: 'Something went wrong',
                onRetry: _resetError,
              ),
            )
          : Stack(
              children: [
                WebViewWidget(controller: _controller),
                if (_isLoading) const LinearProgressIndicator(),
              ],
            ),
      drawer: AppDrawer(),
    );
  }
}
