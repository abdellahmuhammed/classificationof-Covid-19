import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/layout/cubit/home%20cuibt/covid_home_layou_cubit.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsOfCountries extends StatelessWidget {
  const StatisticsOfCountries({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries Status'),
      ),
      body: ConditionalBuilder(
        condition: true,
        builder: (BuildContext context) => buildStatisticsOfCountries(),
        fallback: (BuildContext context) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget buildStatisticsOfCountries() => ListView.builder(
      physics: const BouncingScrollPhysics(),
      // itemCount: countriesData == null ? 0 : countriesData.length,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          height: 130,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.grey[100],
                offset: const Offset(0, 10),
                blurRadius: 10)
          ]),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'country',
                      // countriesData[index]['country'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.network(
                      'https://disease.sh/assets/img/flags/af.png',
                      // countriesData[index]['countryInfo']['flag'],
                      height: 50,
                      width: 60,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'CONFIRMED:',
                        // + countriesData[index]['cases'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                      const Text(
                        'ACTIVE:',
                        // + countriesData[index]['active'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      const Text(
                        'RECOVERED:',
                        // + countriesData[index]['recovered'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      Text(
                        'DEATHS:',
                        // +countriesData[index]['deaths'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      });
}
