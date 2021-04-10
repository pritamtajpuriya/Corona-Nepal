import 'package:flutter/material.dart';
import '../bloc/bloc.dart';
import '../classes/constant.dart';

import '../localization/shareprefence.dart';
import '../resources/repository.dart';

class CountryDetailsList extends StatefulWidget {
  @override
  _CountryDetailsListState createState() => _CountryDetailsListState();
}

class _CountryDetailsListState extends State<CountryDetailsList> {
  final _repo = Repository();
  List<Country> _countryList;
  TextEditingController queryText = TextEditingController();

  @override
  void initState() {
    // fetchCountrydata();
    super.initState();

    fetchCountrydata().then((data) {
      setState(() {
        _countryList = data;
      });
    });
  }

  fetchCountrydata() async {
    final daaa = await _repo.fetchCountryList();
    return daaa;
  }

  List<Country> countryList;

  // String get query => queryText.text;
  // set query(String value) {
  //   assert(query != null);
  //   queryText.text = value;
  // }

  handleSearch(String query) {
    print(query);

    setState(() {
      final country = query.isEmpty
          ? _countryList
          : _countryList
              .where((element) =>
                  element.country.toString().toLowerCase().startsWith(query))
              .toList();
      countryList = country;
    });
  }

  clearSearch() {
    queryText.clear();
    setState(() {
      countryList = _countryList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            getTranslated(context, 'infected_country'),
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: _countryList == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: queryText,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () => clearSearch()),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.black, style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.black, style: BorderStyle.solid)),
                        hintText: 'Country Name',
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      onChanged: (text) => handleSearch(text),
                    ),
                  ),
                  Expanded(
                    child: Scrollbar(
                      child: ListView.builder(
                        itemCount: countryList == null
                            ? _countryList.length
                            : countryList.length,
                        itemBuilder: (BuildContext context, index) {
                          final data = countryList == null
                              ? _countryList[index]
                              : countryList[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                // color: Color(0xffc2d7e9),
                                height: 150,
                                child: Row(children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          data.countryInfo.flag,
                                          height: 80,
                                          width: 100,
                                        ),
                                        Text(data.country)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getTranslated(context, 'infected_') +
                                              formator.format(data.cases),
                                        ),
                                        Text(getTranslated(context, 'active_') +
                                            formator.format(data.active)),
                                        Text(getTranslated(
                                                context, 'recovered_') +
                                            formator.format(data.recovered)),
                                        Text(getTranslated(context, 'deaths_') +
                                            formator.format(data.deaths))
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ));
  }
}
