import '../bloc/provider.dart';
import '../localization/shareprefence.dart';
import '../models/nepal_overview_model.dart';
import '../routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widgets/gridbox.dart';

class NepalDetails extends StatefulWidget {
  @override
  _NepalDetailsState createState() => _NepalDetailsState();
}

class _NepalDetailsState extends State<NepalDetails> {
  Future<Null> refreshPull() async {
    await Future.delayed(Duration(seconds: 2));
    _refreshController.refreshCompleted();
    Navigator.pushReplacementNamed(context, nepalDetailsRoute);
  }

  final _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    bloc.nepaldata();

    return Scaffold(
      appBar: AppBar(
        title: Text('Nepal Details'),
      ),
      body: SmartRefresher(
        enablePullUp: false,
        enablePullDown: true,
        onRefresh: refreshPull,
        controller: _refreshController,
        header: WaterDropHeader(),
        child: StreamBuilder(
            stream: bloc.nepalDataTime,
            builder: (context, AsyncSnapshot<NepalDataOverview> snapshot) {
              final data = snapshot.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslated(context, 'nepal_latest_data'),
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          ),
                          Text(snapshot.hasData
                              ? getTranslated(context, 'last_update') +
                                  bloc.readTimeStamp(data.lastUpdate)
                              : getTranslated(context, 'last_update'))
                        ],
                      ),
                    ),
                  ),
                  StreamBuilder(
                      stream: bloc.nepalDataTotal,
                      builder:
                          (context, AsyncSnapshot<NepalDataForTotal> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        final data = snapshot.data;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GridBox(
                                  color: Color(0xfffae2e6),
                                  number:
                                      bloc.formator.format(data.testedPositive),
                                  title:
                                      getTranslated(context, 'tested_positive'),
                                ),
                                GridBox(
                                  color: Color(0xffb9fbc4),
                                  number: bloc.formator.format(data.recovered),
                                  title: getTranslated(context, 'recovered'),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GridBox(
                                  color: Color(0xffe5effb),
                                  number:
                                      bloc.formator.format(data.testedTotal),
                                  title: getTranslated(context, 'pcr_test_num'),
                                ),
                                GridBox(
                                    color: Color(0xffe7e7fe),
                                    number:
                                        bloc.formator.format(data.testedRdt),
                                    title:
                                        getTranslated(context, 'rdt_test_num'))
                              ],
                            ),
                            Row(
                              children: [
                                GridBox(
                                  color: Color(0xffebd6ff),
                                  number:
                                      bloc.formator.format(data.quarantined),
                                  title: getTranslated(context, 'quarantined'),
                                ),
                                GridBox(
                                    color: Color(0xffb2d4fe),
                                    number:
                                        bloc.formator.format(data.inIsolation),
                                    title: getTranslated(context, 'isolation')),
                              ],
                            ),
                            Row(
                              children: [
                                GridBox(
                                  color: Color(0xfffb999e),
                                  number: bloc.formator.format(data.deaths),
                                  title: getTranslated(context, 'deaths'),
                                )
                              ],
                            ),
                          ],
                        );
                      }),
                ],
              );
            }),
      ),
      // body: ListView(
      //   children: [
      //     Container(
      //       child: Text(
      //         ' नेपालको पछिल्लो तथ्यांक ',
      //         style: TextStyle(color: Colors.red),
      //       ),
      //     ),

      //   ],
      // ),
    );
  }
}
