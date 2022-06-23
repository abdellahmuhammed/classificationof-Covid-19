import 'dart:convert';
import 'package:finalproject/modules/Screens/covid%2019/data_source.dart';
import 'package:finalproject/modules/Screens/covid%2019/pages/country_page.dart';
import 'package:finalproject/modules/Screens/covid%2019/panels/info_panel.dart';
import 'package:finalproject/modules/Screens/covid%2019/panels/most_effected_countries.dart';
import 'package:finalproject/modules/Screens/covid%2019/panels/world_wide_panel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;

  fetchWorldWideData() async {
    // var url = Uri.parse('https://corona.lmao.ninja/v2/all');
    // var response = await http.post(url);

    var url = Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases');
    var response = await http.post(url);
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countriesData;

  fetchCountriesData() async {
    var url = Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases');
    var response = await http.post(url);
    setState(() {
      countriesData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchWorldWideData();
    fetchCountriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('COVID-19 Panel'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(DataSource.quote,
                  style: TextStyle(
                      color: Colors.orange[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Worldwide',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: primaryBlack,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Regional',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
           WorldWidePanel(),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Most affected Countries',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            countriesData == null
                ? Container()
                : MostAffectedPanel(
                    countryData: countriesData,
                  ),
            const SizedBox(
              height: 5,
            ),
            InfoPanel(),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'WE ARE TOGETHER IN THIS :)',
                style: TextStyle(
                    color: primaryBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
