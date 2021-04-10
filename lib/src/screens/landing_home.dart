import 'package:corona/src/screens/home_screen.dart';
import 'package:corona/src/screens/news_field.dart';
import 'package:flutter/material.dart';

class LandingHome extends StatefulWidget {
  @override
  _LandingHomeState createState() => _LandingHomeState();
}

class _LandingHomeState extends State<LandingHome> {
  int _sellectedIndex = 0;
  PageController _c;
  @override
  void initState() {
    super.initState();
    _c = PageController(initialPage: _sellectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _c,
        onPageChanged: (newPage) {
          setState(() {
            _sellectedIndex = newPage;
          });
        },
        children: [HomeScreen(), NewsField()],
      ),
      // body: Stack(
      //   children: [
      //     Offstage(
      //       offstage: _sellectedIndex != 0,
      //       child: TickerMode(
      //         enabled: _sellectedIndex == 0,
      //         child: HomeScreen(),
      //       ),
      //     ),
      //     Offstage(
      //       offstage: _sellectedIndex != 1,
      //       child: TickerMode(
      //         enabled: _sellectedIndex == 1,
      //         child: NewsField(),
      //       ),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.fiber_new),
            label: "News",
          )
        ],
        currentIndex: _sellectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          this._c.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
      ),
    );
  }
}
