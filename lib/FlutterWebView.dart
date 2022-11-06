import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main(List<String> args) {
  runApp(
    FlutterWebView(),
  );
}

class FlutterWebView extends StatelessWidget {
  const FlutterWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepageforflutterwebview(),
    );
  }
}

class Homepageforflutterwebview extends StatefulWidget {
  const Homepageforflutterwebview({Key? key}) : super(key: key);

  @override
  State<Homepageforflutterwebview> createState() =>
      _HomepageforflutterwebviewState();
}

class _HomepageforflutterwebviewState extends State<Homepageforflutterwebview> {
  @override
  void initState() {
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Flutter WebView'),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: 'https://www.google.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    ));
  }
}
