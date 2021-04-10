import 'package:cached_network_image/cached_network_image.dart';
import 'package:corona/src/screens/news_webView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import '../classes/constant.dart';

class NewsPreview extends StatelessWidget {
  NewsPreview(
      {this.id,
      this.url,
      this.title,
      this.summary,
      this.imageUrl,
      this.createdAt,
      this.updatedAt,
      this.source});

  final String id;

  final String url;
  final String title;
  final String source;

  final String summary;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              children: [
                Text(
                  title,
                  style: GoogleFonts.oswald(
                      textStyle:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                ),
                Row(
                  children: [
                    Icon(Icons.access_time),
                    Text(
                      ' ' + timeAgo(createdAt) + ' ',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    // ListTile(
                    //   leading: Icon(Icons.link),
                    //   title: Text(
                    //   '  ' + source,
                    //   style: TextStyle(
                    //       fontSize: 20,
                    //       color: Colors.blue,
                    //       decoration: TextDecoration.underline),
                    // ),
                    // )

                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: GestureDetector(
                          onTap: () {
                            final RenderBox box = context.findRenderObject();
                            Share.share(url,
                                subject: '',
                                sharePositionOrigin:
                                    box.localToGlobal(Offset.zero) & box.size);
                          },
                          child: Container(
                              height: 60,
                              width: 60,
                              color: Colors.amber,
                              child: Icon(Icons.share)),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.link,
                      color: Colors.blue,
                      size: 30,
                    ),
                    Text(
                      ' ' + source,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Text(
                  summary,
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: 60,
                    width: 250,
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => NewsWebView(
                                      newsUrl: url,
                                    )));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.language,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            ' पुरा समाचार हेर्नुहोस्',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
