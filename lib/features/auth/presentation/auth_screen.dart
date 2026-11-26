import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/di/service_locator.dart';
import '../constants/auth_constants.dart';
import 'bloc/auth_cubit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onNavigationRequest: (request) async {
                final url = request.url;

                if (!url.contains(AuthConstants.accessTokenKey)) {
                  return NavigationDecision.navigate;
                }

                await locator<AuthCubit>().loginWithCallbackUrl(url);

                return NavigationDecision.prevent;
              },
            ),
          )
          ..loadRequest(AuthConstants.authorizeUri),
      ),
    );
  }
}
