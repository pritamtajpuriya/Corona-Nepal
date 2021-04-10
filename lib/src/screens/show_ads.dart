// import 'package:firebase_admob/firebase_admob.dart';
// import 'package:flutter/material.dart';

// class ShowAds extends StatefulWidget {
//   @override
//   _ShowAdsState createState() => _ShowAdsState();
// }

// class _ShowAdsState extends State<ShowAds> {
//   MobileAdTargetingInfo targetingInfo;
//   BannerAd myBanner;
//   InterstitialAd myInterstitial;

//   @override
//   void initState() {
//     super.initState();
//     targetingInfo = MobileAdTargetingInfo(
//       keywords: <String>['flutterio', 'beautiful apps'],
//       contentUrl: 'https://flutter.io',
//       birthday: DateTime.now(),
//       childDirected: false,
//       designedForFamilies: false,
//       gender: MobileAdGender
//           .male, // or MobileAdGender.female, MobileAdGender.unknown
//       testDevices: <String>[], // Android emulators are considered test devices
//     );

//     myBanner = BannerAd(
//       // Replace the testAdUnitId with an ad unit id from the AdMob dash.
//       // https://developers.google.com/admob/android/test-ads
//       // https://developers.google.com/admob/ios/test-ads
//       adUnitId: BannerAd.testAdUnitId,
//       size: AdSize.smartBanner,
//       targetingInfo: targetingInfo,
//       listener: (MobileAdEvent event) {
//         print("BannerAd event is $event");
//       },
//     );

//     myInterstitial = InterstitialAd(
//       // Replace the testAdUnitId with an ad unit id from the AdMob dash.
//       // https://developers.google.com/admob/android/test-ads
//       // https://developers.google.com/admob/ios/test-ads
//       adUnitId: InterstitialAd.testAdUnitId,
//       targetingInfo: targetingInfo,
//       listener: (MobileAdEvent event) {
//         print("InterstitialAd event is $event");
//       },
//     );
//   }

//   void showBannerAd() {
//     myBanner
//       // typically this happens well before the ad is shown
//       ..load()
//       ..show(
//         // Positions the banner ad 60 pixels from the bottom of the screen
//         anchorOffset: 1.0,
//         // Positions the banner ad 10 pixels from the center of the screen to the right
//         horizontalCenterOffset: 10.0,
//         // Banner Position
//         anchorType: AnchorType.bottom,
//       );
//   }

//   void showIterstialAd() {
//     myInterstitial
//       ..load()
//       ..show(
//         anchorType: AnchorType.bottom,
//         anchorOffset: 0.0,
//         horizontalCenterOffset: 0.0,
//       );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ads Page'),
//       ),
//       body: Column(
//         children: [
//           RaisedButton(
//             child: Text("Banner Ads"),
//             onPressed: showBannerAd,
//           ),
//           RaisedButton(
//             child: Text('Interstial Ads'),
//             onPressed: showIterstialAd,
//           )
//         ],
//       ),
//     );
//   }
// }
