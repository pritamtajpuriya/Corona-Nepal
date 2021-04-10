import '../localization/shareprefence.dart';
import '../routes/routes.dart';

import 'package:share/share.dart';

import 'package:flutter/material.dart';

Widget drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        AssetImage('assets/images/eastern_app.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
        ListTile(
            leading: Icon(
              Icons.question_answer,
            ),
            title: Text(getTranslated(context, 'faq')),
            onTap: () => Navigator.popAndPushNamed(context, faqRoute)),
        ListTile(
          leading: Icon(
            Icons.language,
          ),
          title: Text(getTranslated(context, "infected_country_list")),
          onTap: () =>
              Navigator.popAndPushNamed(context, infected_country_listRoute),
        ),
        ListTile(
          leading: Text(
            '🇳🇵',
            style: TextStyle(fontSize: 18),
          ),
          title: Text(getTranslated(context, 'nepal_latest_data')),
          onTap: () => Navigator.popAndPushNamed(context, nepalDetailsRoute),
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text(getTranslated(context, 'share')),
          onTap: () {
            final RenderBox box = context.findRenderObject();
            Share.share('App link Not Available',
                subject: '',
                sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text(getTranslated(context, 'about')),
          onTap: () => Navigator.popAndPushNamed(context, 'about'),
        ),
        // ListTile(
        //   leading: Icon(Icons.adb),
        //   title: Text('Show Ads'),
        //   onTap: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //       builder: (context) => ShowAds(),
        //     ));
        //   },
        // )
      ],
    ),
  );
}
