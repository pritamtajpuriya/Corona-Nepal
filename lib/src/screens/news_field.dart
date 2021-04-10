import 'package:cached_network_image/cached_network_image.dart';
import 'package:corona/src/models/news_model.dart';
import 'package:corona/src/resources/repository.dart';
import 'package:corona/src/screens/news_preview.dart';
import 'package:flutter/material.dart';

class NewsField extends StatefulWidget {
  @override
  _NewsFieldState createState() => _NewsFieldState();
}

class _NewsFieldState extends State<NewsField> {
  final ress = Repository();
  List<NewsModel> _newslist = [];

  // fetchNews() async {
  //   final data = await ress.fetchNews();
  //   print(data.toString());
  //   print('this issss');
  //   _newslist.add(data);
  // }

  @override
  void initState() {
    super.initState();
    ress.fetchNews().then((value) {
      setState(() {
        _newslist.addAll(value);
      });
    });
    print('lemngf');
    print(_newslist.length);
  }

  String timeAgo(DateTime d) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365)
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    if (diff.inDays > 30)
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    if (diff.inDays > 7)
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    if (diff.inDays > 0)
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    if (diff.inHours > 0)
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    if (diff.inMinutes > 0)
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    return "just now";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        ),
        body: Scrollbar(
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: _newslist == null ? 0 : _newslist.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => NewsPreview(
                                        imageUrl: _newslist[index].imageUrl,
                                        title: _newslist[index].title,
                                        source: _newslist[index].source,
                                        summary: _newslist[index].summary,
                                        createdAt: _newslist[index].createdAt,
                                        url: _newslist[index].url,
                                      )));
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: _newslist[index].imageUrl,
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                _newslist[index].title,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.link,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      ' ' + _newslist[index].source,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                _newslist[index].summary,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black54),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    ' ' + timeAgo(_newslist[index].createdAt),
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black54),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
        ));
  }
}
