import 'package:finalproject/layout/cubit/home%20cuibt/covid_home_layou_cubit.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class StatisticsOfWorld extends StatelessWidget {
  const StatisticsOfWorld({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 1, crossAxisSpacing: 1),
        children: <Widget>[
          BuildContainerOfStatistics(
            title: 'Cases',
            count: CovidHomeLayouCubit.get(context).covidStaticsWorld.cases.toString(),
            containerColor: grey[350],
            textColor: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          // BuildContainerOfStatistics(
          //   title: 'TodayCases',
          //   count: CovidHomeLayouCubit.get(context)
          //       .covidStaticsWorld
          //       .todayCases
          //       .toString(),
          //   containerColor: grey[350],
          //   textColor: Colors.black,
          //   fontSize: 23,
          //   fontWeight: FontWeight.bold,
          // ),
          BuildContainerOfStatistics(
            title: 'Recovered',
            count: CovidHomeLayouCubit.get(context)
                .covidStaticsWorld
                .recovered
                .toString(),
            containerColor: grey[350],
            textColor: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          BuildContainerOfStatistics(
            title: 'Deaths',
            count: CovidHomeLayouCubit.get(context)
                .covidStaticsWorld
                .deaths
                .toString(),
            containerColor: grey[350],
            textColor: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          // BuildContainerOfStatistics(
          //   title: 'TodayDeaths',
          //   count: CovidHomeLayouCubit.get(context)
          //       .covidStatics
          //       .todayDeaths
          //       .toString(),
          //   containerColor: grey[350],
          //   textColor: Colors.black,
          //   fontSize: 21,
          //   fontWeight: FontWeight.bold,
          // ),
          BuildContainerOfStatistics(
            title: 'Active',
            count: CovidHomeLayouCubit.get(context)
                .covidStaticsWorld
                .active
                .toString(),
            containerColor: grey[350],
            textColor: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
