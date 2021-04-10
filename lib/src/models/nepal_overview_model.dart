class NepalDataOverview {
  int cases;
  int deaths;
  int recovered;
  int lastUpdate;
  int newCases;
  int newDeaths;

  NepalDataOverview.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    deaths = json['deaths'];
    recovered = json['recovered'];
    lastUpdate = json['updated'];
    newCases = json['todayCases'];
    newDeaths = json['todayDeaths'];
  }
}

class NepalDataForTotal {
  int testedPositive;
  int testedNegative;
  int testedTotal;
  int inIsolation;
  int quarantined;
  int testedRdt;
  int pendingResult;
  int recovered;
  int deaths;
  DateTime updatedAt;

  NepalDataForTotal.fromJson(Map<String, dynamic> json) {
    testedPositive = json["tested_positive"];
    testedNegative = json["tested_negative"];
    testedTotal = json["tested_total"];
    inIsolation = json["in_isolation"];
    quarantined = json["quarantined"];
    testedRdt = json["tested_rdt"];
    pendingResult = json["pening_result"];
    recovered = json["recovered"];
    deaths = json["deaths"];
    updatedAt = DateTime.parse(json["updated_at"]);
  }
}
