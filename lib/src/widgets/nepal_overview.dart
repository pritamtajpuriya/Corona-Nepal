import 'package:flutter/material.dart';

class NepalOverview extends StatelessWidget {
  final Color color;
  final int number;
  final String title;
  final Widget child;
  final String newcase;

  NepalOverview(
      {this.color, this.number, this.title, this.child, this.newcase});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 25,
          width: 25,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.2),
          ),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: color, width: 2)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        child,
        Text(
          title,
          style: TextStyle(color: Color(0xFF4B4B4B), fontSize: 16),
        ),
        Text(newcase)
      ],
    );
  }
}
