import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/layout/cubit/home%20cuibt/covid_home_layou_cubit.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsOfEgypt extends StatelessWidget {
  const StatisticsOfEgypt({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CovidHomeLayouCubit, CovidHomeLayouState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ConditionalBuilder(
      condition: CovidHomeLayouCubit.get(context).covidStaticsOfEgypt != null,
      builder: (BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Colors.blueGrey[100]),
          title:  Text('Statistics Of Egypt ' ,  style: Theme.of(context).textTheme.bodyText1,),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[100],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 1, crossAxisSpacing: 1),
            children: <Widget>[
              BuildContainerOfStatistics(
                title: 'Cases',
                count: CovidHomeLayouCubit.get(context).covidStaticsOfEgypt.cases
                    .toString(),
                containerColor: grey[350],
                textColor: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              BuildContainerOfStatistics(
                title: 'Recovered',
                count: CovidHomeLayouCubit.get(context)
                    .covidStaticsOfEgypt
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
                    .covidStaticsOfEgypt
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
                    .covidStaticsOfEgypt
                    .active
                    .toString(),
                containerColor: grey[350],
                textColor: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
      fallback: (BuildContext context) => const Center( child: CircularProgressIndicator(),),
      
    );
  },
);
  }
}