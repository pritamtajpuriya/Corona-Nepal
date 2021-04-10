import 'dart:convert';

import 'package:corona/src/models/news_model.dart';

import '../models/world_infection_model.dart';
import '../models/nepal_overview_model.dart';

import '../models/country.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

class Repository {
  static final client = http.Client();
  static Future<GlobleOverview> fetchGlobleData() async {
    try {
      final responseGloble =
          await client.get('https://data.nepalcorona.info/api/v1/world');
      final parsedJson = jsonDecode(responseGloble.body);
      print(parsedJson);
      return GlobleOverview.fromJson(parsedJson);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<NepalDataOverview> fetchNepalData() async {
    try {
      final responseNepal = await client.get(
          'https://disease.sh/v3/covid-19/countries/nepal?yesterday=false&twoDaysAgo=false&strict=true');

      final parsedJson = jsonDecode(responseNepal.body);

      return NepalDataOverview.fromJson(parsedJson);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<NepalDataForTotal> fetchNepalDataForTotal() async {
    try {
      final responseNepal =
          await client.get('https://nepalcorona.info/api/v1/data/nepal');

      final parsedJson = jsonDecode(responseNepal.body);

      return NepalDataForTotal.fromJson(parsedJson);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<Country>> fetchCountryList() async {
    try {
      final response = await client
          .get('https://disease.sh/v3/covid-19/countries?sort=cases');
      final List<Country> country = countryFromJson(response.body);

      return country;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<Country>> fetchCountryListYesterday() async {
    try {
      final response = await client.get(
          'https://disease.sh/v3/covid-19/countries?yesterday=true&sort=cases');
      final List<Country> country = countryFromJson(response.body);

      return country;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<Country>> fetchCountryList2DayAgo() async {
    try {
      final response = await client.get(
          'https://disease.sh/v3/covid-19/countries?twoDaysAgo=true&sort=cases');
      final List<Country> country = countryFromJson(response.body);

      return country;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<NewsModel>> fetchNews() async {
    try {
      final response = await client.get('https://nepalcorona.info/api/v1/news');

      var ddd = json.decode(response.body);

      List<dynamic> dd = ddd['data'];

      // var dd = ddd['data'];

      // for (var dd in dd) {
      //   list.add(NewsModel.fromJson(dd));
      // }
      List<NewsModel> list =
          dd.map((dynamic news) => NewsModel.fromJson(news)).toList();

      return list;
    } catch (e) {}
    return null;
  }
}
