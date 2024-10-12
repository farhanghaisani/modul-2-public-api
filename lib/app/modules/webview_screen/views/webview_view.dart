import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class WebViewView extends GetView {
  const WebViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://playvalorant.com/id-id/news'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('berita valorant'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
