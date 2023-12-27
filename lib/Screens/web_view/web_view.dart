import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  String url;
  WebViewScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    WebViewController control = WebViewController()
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
        controller: control, // Enable JavaScript (optional)
      ),
    );
  }
}
