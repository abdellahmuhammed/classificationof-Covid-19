// ignore_for_file: camel_case_types

import 'package:finalproject/layout/Statistics/MostAffected/MostAffected.dart';
import 'package:finalproject/layout/Statistics/statistics%20of%20countries%20Screen/statistics%20of%20countries.dart';
import 'package:finalproject/layout/cubit/home%20cuibt/covid_home_layou_cubit.dart';
import 'package:finalproject/layout/detilsScreen/detilsScreen.dart';
import 'package:finalproject/modules/Screens/covid%2019/panels/most_effected_countries.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../modules/Screens/covid 19/data_source.dart';

class StatisticsOfWorld extends StatelessWidget {
  const StatisticsOfWorld({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer <CovidHomeLayouCubit, CovidHomeLayouState>(
      listener: (context, state) {},
      builder: (context, state){
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: 100,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  color: Colors.orange[100],
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
                       Text(
                        'Worldwide',
                        style: Theme.of(context).textTheme.bodyText1,
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
                          child:  Text(
                            'Regional',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CovidHomeLayouCubit.get(context).covidForAllModel == null ? const CircularProgressIndicator() : buildGridView(context: context),
                //  Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 10),
                //   child: Text(
                //     'Most affected Countries',
                //     style: Theme.of(context).textTheme.bodyText1,
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                // CovidHomeLayouCubit.get(context).getDataOfCountriesList ==null ? Container(): const MostAffected(),
                const SizedBox(
                  height: 10,
                ),
                const DetailsScreen(),

              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildGridView({context}) => GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          BuildContainerOfStatistic(
            title: 'CONFIRMED',
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: '${CovidHomeLayouCubit.get(context).covidForAllModel.cases}',
          ),
          BuildContainerOfStatistic(
            title: 'ACTIVE',
            panelColor: Colors.blue[100],
            textColor: Colors.blue[900],
            count: '${CovidHomeLayouCubit.get(context).covidForAllModel.active}',
          ),
          BuildContainerOfStatistic(
            title: 'RECOVERD',
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: '${CovidHomeLayouCubit.get(context).covidForAllModel.recovered}',
          ),
          BuildContainerOfStatistic(
            title: 'DEATHS',
            panelColor: Colors.grey[400],
            textColor: Colors.grey[900],
            count: '${CovidHomeLayouCubit.get(context).covidForAllModel.deaths}',
          ),
        ],
      );
}
