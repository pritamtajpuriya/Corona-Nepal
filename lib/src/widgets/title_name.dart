import '../localization/shareprefence.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitileName extends StatelessWidget {
  final String titileName;
  final String lastUpdateDate;
  final VoidCallback onPressed;
  final String url;

  TitileName({this.titileName, this.lastUpdateDate, this.onPressed, this.url});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // this is  for Titile
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              url,
                              height: 25,
                              width: 25,
                            ),
                            Text(
                              titileName,
                              style: GoogleFonts.alata(
                                  textStyle: TextStyle(fontSize: 18)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(getTranslated(context, 'last_update') +
                            lastUpdateDate.toString()),
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: onPressed,
                    child: Text(
                      getTranslated(context, 'see_more'),
                      style: GoogleFonts.balooTamma(
                          textStyle: TextStyle(color: Colors.blue)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
