import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebPage extends StatefulWidget {
  static const String routeName = 'webPage';

  final String url;

  MyWebPage({required this.url});

  @override
  _MyWebPageState createState() => _MyWebPageState();
}

@override
void initState() {
  if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
}

class _MyWebPageState extends State<MyWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter WebView '),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
