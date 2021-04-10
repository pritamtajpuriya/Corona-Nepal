import '../classes/constant.dart';
import '../models/country.dart';
import 'package:flutter/material.dart';
import '../localization/shareprefence.dart';

class CountryDetailsSearch extends SearchDelegate {
  List<Country> countryList;
  CountryDetailsSearch(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listForSearch = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element.country.toString().toLowerCase().startsWith(query))
            .toList();
    return listForSearch.isEmpty
        ? Center(child: Text('Country Name Does not Matching'))
        : ListView.builder(
            itemCount: listForSearch.length,
            itemBuilder: (BuildContext context, index) {
              final data = listForSearch[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
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
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    // color: Color(0xffc2d7e9),
                    height: 150,
                    child: Row(children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network(
                              data.countryInfo.flag,
                              height: 90,
                              width: 110,
                            ),
                            Text(data.country)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getTranslated(context, 'infected_') +
                                  formator.format(data.cases),
                            ),
                            Text(getTranslated(context, 'active_') +
                                formator.format(data.active)),
                            Text(getTranslated(context, 'recovered_') +
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
          );
  }
}
