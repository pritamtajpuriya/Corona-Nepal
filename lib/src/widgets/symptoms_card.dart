import 'package:flutter/material.dart';

class Symptomscard extends StatelessWidget {
  final String url;
  final String title;

  Symptomscard({this.url, this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 20,
                    color: Color(0xFF4056C6).withOpacity(.15))
              ]),
          child: Column(
            children: [Image.asset(url, height: 90), Text(title)],
          ),
        ),
      ],
    );
  }
}
