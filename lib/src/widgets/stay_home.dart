import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StayHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'covid - 19',
                    style: GoogleFonts.alata(
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                ),
                Text(
                  'Jhapa Nepal',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
