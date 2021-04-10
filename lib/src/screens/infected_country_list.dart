import '../bloc/provider.dart';
import '../localization/shareprefence.dart';
import '../resources/repository.dart';
import 'package:flutter/material.dart';
import '../bloc/bloc.dart';
import '../models/country.dart';
import 'package:google_fonts/google_fonts.dart';

class InfectedCountryList extends StatefulWidget {
  @override
  _InfectedCountryListState createState() => _InfectedCountryListState();
}

class _InfectedCountryListState extends State<InfectedCountryList> {
  final repo = Repository();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    if (_selectedIndex == 0) {
      bloc.callCountry();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'infected_country_list')),
        centerTitle: true,
      ),
      body: Scrollbar(child: _buildCountryList(bloc)),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_upward),
              label: 'Today',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back), label: "Yesterday"),
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back), label: 'Tomorrow')
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (int index) async {
            setState(() {
              _selectedIndex = index;
            });
            if (index == 0) {
              final _data = await repo.fetchCountryList();
              bloc.countryYesterday(_data);
            }
            if (index == 1) {
              final _data = await repo.fetchCountryListYesterday();
              bloc.countryYesterday(_data);
            }
            if (index == 2) {
              final _data = await repo.fetchCountryList2DayAgo();
              bloc.countryYesterday(_data);
            }
          }),
    );
  }

  Widget _buildCountryList(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.countryStream,
      builder: (BuildContext context, AsyncSnapshot<List<Country>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: DataTable(
                columns: [
                  DataColumn(
                      label: Text(
                        'Country Name',
                        style: GoogleFonts.alata(
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      tooltip: 'represents the Country Name'),
                  DataColumn(
                      label: Text(
                        'Total Cases',
                        style: GoogleFonts.alata(
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      tooltip: 'represents the Country Total cases'),
                  DataColumn(
                      label: Text(
                        'New Cases',
                        style: GoogleFonts.alata(
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      tooltip: 'represents the Country flag'),
                  DataColumn(
                      label: Text(
                        'Total Deaths',
                        style: GoogleFonts.alata(
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      tooltip: 'represents the Country flag'),
                  DataColumn(
                      label: Text(
                        'New Deaths',
                        style: GoogleFonts.alata(
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      tooltip: 'represents the Country flag'),
                  DataColumn(
                      label: Text(
                        'Total Recovered',
                        style: GoogleFonts.alata(
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      tooltip: 'represents the Country flag'),
                  DataColumn(
                      label: Text(
                        'New Recoverd',
                        style: GoogleFonts.alata(
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      tooltip: 'represents the Country flag'),
                  DataColumn(
                      label: Text(
                        'Active Cases',
                        style: GoogleFonts.alata(
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      tooltip: 'represents the Country flag'),
                ],
                rows: snapshot.data
                    .map((data) => DataRow(cells: [
                          DataCell(Container(
                            width: 100,
                            child: Text(data.country,
                                style: TextStyle(fontSize: 14)),
                          )),
                          DataCell(Text(bloc.formator.format(data.cases),
                              style: TextStyle(fontSize: 14))),
                          DataCell(Text(
                              '+' + bloc.formator.format(data.todayCases),
                              style: TextStyle(
                                  fontSize: 14, color: Colors.redAccent[100]))),
                          DataCell(Text(bloc.formator.format(data.deaths),
                              style: TextStyle(fontSize: 14))),
                          DataCell(Text(
                            '+' + bloc.formator.format(data.todayDeaths),
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          )),
                          DataCell(Text(bloc.formator.format(data.recovered),
                              style: TextStyle(fontSize: 14))),
                          DataCell(Text(
                              '+' + bloc.formator.format(data.todayRecovered),
                              style: TextStyle(
                                  color: Colors.green, fontSize: 14))),
                          DataCell(Text(
                            bloc.formator.format(data.active),
                            style: TextStyle(fontSize: 14),
                          )),
                        ]))
                    .toList()),
          ),
        );
      },
    );
  }
}
