// ignore_for_file: camel_case_types

import 'package:finalproject/layout/Statistics/statistics%20of%20countries%20Screen/statistics%20of%20countries.dart';
import 'package:finalproject/layout/cubit/home%20cuibt/covid_home_layou_cubit.dart';
import 'package:finalproject/layout/detilsScreen/detilsScreen.dart';
import 'package:finalproject/modules/Screens/covid%2019/panels/most_effected_countries.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import '../../../modules/Screens/covid 19/data_source.dart';

class StatisticsOfWorld extends StatefulWidget {
  const StatisticsOfWorld({Key key}) : super(key: key);

  @override
  State<StatisticsOfWorld> createState() => _StatisticsOfWorldState();
}

class _StatisticsOfWorldState extends State<StatisticsOfWorld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          CovidHomeLayouCubit.get(context).getStaticsOfWorld();
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              color: Colors.orange[50],
              child: Text(
                'Nothing in life is to be feared, it is only to be understood. Now is the time to understand more, so that we may fear less.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
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
                      NavigateTo(context, const StatisticsOfCountries());
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
            buildGridView(),
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
            const MostAffectedPanel(),
            const SizedBox(
              height: 10,
            ),
            const DetailsScreen(),

          ],
        ),
      ),
    );
  }

  Widget buildGridView() => GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          BuildContainerOfStatistic(
            title: 'CONFIRMED',
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: "worldWide['cases'].toString()",
          ),
          BuildContainerOfStatistic(
            title: 'ACTIVE',
            panelColor: Colors.blue[100],
            textColor: Colors.blue[900],
            count: "worldWide['active'].toString()",
          ),
          BuildContainerOfStatistic(
            title: 'RECOVERD',
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: "worldWide['recovered'].toString()",
          ),
          BuildContainerOfStatistic(
            title: 'DEATHS',
            panelColor: Colors.grey[400],
            textColor: Colors.grey[900],
            count: " worldWide['deaths'].toString()",
          ),
        ],
      );
}
