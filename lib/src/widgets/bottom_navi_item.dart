// import 'package:flutter/material.dart';

// class CreateBottomBAr extends StatefulWidget {
//   @override
//   _CreateBottomBArState createState() => _CreateBottomBArState();
// }

// class _CreateBottomBArState extends State<CreateBottomBAr> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.fiber_new), title: Text('News')),
//         BottomNavigationBarItem(icon: Icon(Icons.add_box), title: Text('about'))
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor: Colors.amber[800],
//       onTap: (int index) {
//         setState(() {});

//         if (_selectedIndex == 1) {
//           Navigator.of(context).pushNamed('newsRoute');
//         }
//       },
//     );
//   }
// }
