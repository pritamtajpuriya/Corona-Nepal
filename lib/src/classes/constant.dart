import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

// bool connectionT;
// Checking Connectivity  WIFI / MOBILE
// void checkStatus() {
//   Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//     if (result == ConnectivityResult.mobile ||
//         result == ConnectivityResult.wifi) {
//       connectionStatus(true);
//     } else
//       connectionStatus(false);
//   });
// }

// bool connectionStatus(bool connection) {
//   connectionT = connection;
//   return connectionT;
// }

//change English number INTO Nepali number

String replaceNepaliNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const nepali = ['०', '१', '२', '३ ', '४', '५', '६', '७', '८', '९'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], nepali[i]);
  }
  return input;
}

final formator = NumberFormat('#,###');

const countryListStyle = TextStyle(fontSize: 16);

String timeAgo(DateTime d) {
  Duration diff = DateTime.now().difference(d);
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
