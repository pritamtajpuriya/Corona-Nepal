import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatelessWidget {
  final String newsUrl;
  NewsWebView({this.newsUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.black),
            ),
            Text('Field', style: TextStyle(color: Colors.blue))
          ],
        ),
        actions: [
          Opacity(
              opacity: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
              ))
        ],
      ),
      body: WebView(
        initialUrl: newsUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
