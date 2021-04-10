import 'dart:async';
import 'package:intl/intl.dart';

import '../models/nepal_overview_model.dart';
import '../models/world_infection_model.dart';
import '../resources/repository.dart';
import '../models/country.dart';

export '../models/country.dart';

class Bloc {
  final repository = Repository();

  // StreamController

  final _globleOverview = StreamController<GlobleOverview>.broadcast();
  final _nepalOverview = StreamController<NepalDataOverview>.broadcast();
  final _nepalDataForTotal = StreamController<NepalDataForTotal>.broadcast();
  final _countryController = StreamController<List<Country>>.broadcast();

// steams
  Stream<GlobleOverview> get globleDAta => _globleOverview.stream;
  Stream<NepalDataOverview> get nepalDataTime => _nepalOverview.stream;
  Stream<NepalDataForTotal> get nepalDataTotal => _nepalDataForTotal.stream;
  Stream<List<Country>> get countryStream => _countryController.stream;

  // sink

  Function(NepalDataOverview data) get nepalDataSink => _nepalOverview.sink.add;
  Function(GlobleOverview data) get globleDataSink => _globleOverview.sink.add;
  Function(List<Country> data) get countryYesterday =>
      _countryController.sink.add;

  callFunction() async {
    final _globeData = await Repository.fetchGlobleData();
    _globleOverview.sink.add(_globeData);
    print(_globeData);

    final _nepalDataTime = await repository.fetchNepalData();
    _nepalOverview.sink.add(_nepalDataTime);
  }

  callCountry() async {
    final _countryList = await repository.fetchCountryList();
    _countryController.sink.add(_countryList);
  }

  nepaldata() async {
    final _nepalData = await repository.fetchNepalDataForTotal();
    _nepalDataForTotal.sink.add(_nepalData);
    final _nepalDataTime = await repository.fetchNepalData();
    _nepalOverview.sink.add(_nepalDataTime);
  }

  final formator = NumberFormat('#,###');

  String time(String date) {
    DateFormat format = new DateFormat('HH:mm:ss');
    DateTime time = format.parse(date);
    return time.toString();
  }

  String readTimeStamp(timeStamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timeStamp);

    Duration diff = DateTime.now().difference(date);
    if (diff.inDays > 365)
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    if (diff.inDays > 30)
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    if (diff.inDays > 7)
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    if (diff.inDays > 0)
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    if (diff.inHours > 0)
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    if (diff.inMinutes > 0)
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    return "just now";
  }

  disposed() {
    _globleOverview.close();
    _nepalOverview.close();
    _countryController.close();
    _nepalDataForTotal.close();
  }
}
