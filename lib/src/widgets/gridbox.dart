import 'package:flutter/material.dart';

class GridBox extends StatelessWidget {
  final Color color;
  final String title;
  final String number;
  GridBox({this.color, this.title, this.number});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                number,
                style: TextStyle(fontSize: 16),
              ),
              Text(title)
            ],
          ),
        ),
      ),
    );
  }
}
