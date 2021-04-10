import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/eastern_app.png'),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image(
                  image: AssetImage(
                    'assets/images/facebook.png',
                  ),
                  height: 80,
                  width: 80,
                ),
                Image(
                  image: AssetImage(
                    'assets/images/twitter.png',
                  ),
                  height: 80,
                  width: 80,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage(
                    'assets/images/network.png',
                  ),
                  height: 80,
                  width: 80,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image(
                  image: AssetImage(
                    'assets/images/linkedin.png',
                  ),
                  height: 80,
                  width: 80,
                ),
                Image(
                  image: AssetImage(
                    'assets/images/dribbble.png',
                  ),
                  height: 80,
                  width: 80,
                )
              ],
            ),
            SizedBox(
              height: 45,
            ),
            Center(
              child: Text(
                'Design and Developed by Pritam Tajpuriya',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}
