import 'package:corona/src/controller/global_overview._contoller.dart';
import 'package:corona/src/screens/landing_home.dart';
import 'package:corona/src/widgets/dropdown.dart';
import 'package:get/get.dart';

import '../bloc/provider.dart';
import '../classes/constant.dart';

import '../localization/shareprefence.dart';
import '../models/nepal_overview_model.dart';
import '../models/world_infection_model.dart';
import '../screens/country_list.dart';

import '../widgets/nepal_overview.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../widgets/symptoms_card.dart';

import '../widgets/title_name.dart';
import '../screens/nepal_details..dart';

import '../resources/repository.dart';

import '../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final repository = Repository();

  final GlobalController globalController = Get.put(GlobalController());

  @override
  void initState() {
    super.initState();
  }

  // Location Fetch Codes

  // Codes For SmartRefresh Plugin
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  Future<Null> refreshPull() async {
    await Future.delayed(Duration(seconds: 2));
    _refreshController.refreshCompleted();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => LandingHome()));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    bloc.callFunction();

    return Scaffold(
        appBar: AppBar(
            centerTitle: true, title: Text(getTranslated(context, 'title')),
            // For Language Selector
            actions: [Dropdownbtn()]),
        backgroundColor: Color(0xFFFEFEFE),
        drawer: drawer(context),
        body: SmartRefresher(
          enablePullUp: false,
          enablePullDown: true,
          onRefresh: refreshPull,
          controller: _refreshController,
          header: WaterDropHeader(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                StreamBuilder(
                    stream: bloc.nepalDataTime,
                    builder:
                        (context, AsyncSnapshot<NepalDataOverview> snapshot) {
                      return TitileName(
                        titileName: getTranslated(context, 'nepal_update'),
                        lastUpdateDate: snapshot.hasData
                            ? bloc.readTimeStamp(snapshot.data.lastUpdate)
                            : '---',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NepalDetails(),
                              ));
                        },
                        url: 'assets/images/nepal_flag.gif',
                      );
                    }),
                // Nepal Overview
                nepalOverview(bloc),

                // Banner Ads
                // Center(
                //   child: AdmobBanner(
                //       adUnitId: ams.getBannerAdId(),
                //       adSize: AdmobBannerSize.BANNER),
                // ),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder(
                    stream: bloc.globleDAta,
                    builder: (context, AsyncSnapshot<GlobleOverview> snapshot) {
                      return TitileName(
                        titileName: getTranslated(context, 'globle_update'),
                        lastUpdateDate: snapshot.hasData
                            ? bloc.readTimeStamp(snapshot.data.lastUpdate)
                            : '---',
                        onPressed: () {
                          // newInterstialAd.show(
                          //   anchorType: AnchorType.bottom,
                          //   anchorOffset: 0.0,
                          //   horizontalCenterOffset: 0.0,
                          // );

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CountryDetailsList(),
                              ));
                        },
                        url: 'assets/images/globle.png',
                      );
                    }),
                globleOverview(globalController, bloc),
                // symptoms
                Padding(
                  // this is for symptoms
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          getTranslated(context, 'symptoms'),
                          style:
                              TextStyle(fontSize: 18, color: Color(0xFF303030)),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Symptomscard(
                              url: 'assets/images/fever.gif',
                              title: getTranslated(context, 'headache'),
                            ),
                            Symptomscard(
                                url: 'assets/images/dry_cough.gif',
                                title: getTranslated(context, 'dry_cough')),
                            Symptomscard(
                                url: 'assets/images/tiredness.gif',
                                title: getTranslated(context, 'tiredness'))
                          ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // prevension
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    getTranslated(context, 'prevension'),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Prevension Widgets
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: SizedBox(
                    height: 170,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xff3383cd),
                                    Color(0xff11249f)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Positioned(
                          left: -15,
                          child: Image.asset(
                            'assets/images/wear_maks.png',
                            height: 195,
                          ),
                        ),
                        Positioned(
                            left: 160,
                            width: MediaQuery.of(context).size.width - 180,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      getTranslated(context, 'wear_face_mask'),
                                      style: GoogleFonts.alata(
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)),
                                    ),
                                    Text(
                                      getTranslated(context, 'mask_status'),
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        getTranslated(context, 'social_distance'),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/distance.png',
                        width: MediaQuery.of(context).size.width - 50,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget nepalOverview(Bloc bloc) {
    return StreamBuilder<NepalDataOverview>(
      stream: bloc.nepalDataTime,
      builder:
          (BuildContext context, AsyncSnapshot<NepalDataOverview> snapshot) {
        var data = snapshot.hasData;

        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 20,
                      color: Color(0xFF4056C6).withOpacity(.15))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NepalOverview(
                  color: Color(0xFFFF8748),
                  child: data
                      ? Text(bloc.formator.format(snapshot.data.cases),
                          style:
                              TextStyle(fontSize: 18, color: Color(0xFFFF8748)))
                      : Text('---'),
                  title: getTranslated(context, 'infected'),
                  newcase: data
                      ? '+ ' +
                          bloc.formator.format(snapshot.data.newCases) +
                          getTranslated(context, 'added_cases')
                      : '---',
                ),
                NepalOverview(
                  color: Color(0xFF36C12C),
                  child: data
                      ? Text(formator.format(snapshot.data.recovered),
                          style:
                              TextStyle(fontSize: 18, color: Color(0xFFFF8748)))
                      : Text('---'),
                  title: getTranslated(context, 'recovered'),
                  newcase: '',
                ),
                NepalOverview(
                  color: Color(0xFFFF4848),
                  child: data
                      ? Text(bloc.formator.format(snapshot.data.deaths),
                          style:
                              TextStyle(fontSize: 18, color: Color(0xFFFF8748)))
                      : Text('---'),
                  title: getTranslated(context, 'deaths'),
                  newcase: data
                      ? '+ ' +
                          bloc.formator.format(snapshot.data.newDeaths) +
                          getTranslated(context, 'added_deaths')
                      : '---',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget globleOverview(GlobalController controller, Bloc bloc) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Obx(() {
        if (globalController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else
          return Container(
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(
                        10,
                        10,
                      ),
                      blurRadius: 20,
                      color: Color(0xFF4056C6).withOpacity(0.2))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NepalOverview(
                    color: Color(0xFFFF8748),
                    child: Text(
                        bloc.formator
                            .format(controller.globalOverview.value.cases),
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFFFF8748))),
                    title: getTranslated(context, 'infected'),
                    newcase: bloc.formator
                            .format(controller.globalOverview.value.newCases) +
                        getTranslated(context, 'added_cases')),
                NepalOverview(
                  color: Color(0xFF36C12C),
                  child: Text(
                      bloc.formator
                          .format(controller.globalOverview.value.recoverd),
                      style: TextStyle(fontSize: 18, color: Color(0xFFFF8748))),
                  title: getTranslated(context, 'recovered'),
                  newcase: '',
                ),
                NepalOverview(
                    color: Color(0xFFFF4848),
                    child: Text(
                        bloc.formator
                            .format(controller.globalOverview.value.deaths),
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFFFF8748))),
                    title: getTranslated(context, 'deaths'),
                    newcase: '+ ' +
                        bloc.formator
                            .format(controller.globalOverview.value.newDeaths) +
                        getTranslated(context, 'added_deaths')),
              ],
            ),
          );
      }),
    );
  }
}

// class NepalOverview extends StatelessWidget {
//   final Color color;
//   final int number;
//   final String title;

//   NepalOverview({this.color, this.number, this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Container(
//           height: 25,
//           width: 25,
//           padding: EdgeInsets.all(6),
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: color.withOpacity(0.2),
//           ),
//           child: Container(
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.transparent,
//                 border: Border.all(color: color, width: 2)),
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Text(
//           number.toString(),
//           style: TextStyle(fontSize: 30, color: Color(0xFFFF8748)),
//         ),
//         Text(
//           title,
//           style: TextStyle(color: Color(0xFF4B4B4B), fontSize: 16),
//         )
//       ],
//     );
//   }
// }
