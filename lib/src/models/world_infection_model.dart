class GlobleOverview {
  int cases;
  int deaths;
  int recoverd;
  int lastUpdate;
  int newCases;
  int newDeaths;
  GlobleOverview(
      {this.cases,
      this.deaths,
      this.recoverd,
      this.lastUpdate,
      this.newCases,
      this.newDeaths});

  GlobleOverview.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    deaths = json['deaths'];
    recoverd = json['recovered'];
    lastUpdate = json['updated'];
    newCases = json['todayCases'];
    newDeaths = json['todayDeaths'];
  }
}
