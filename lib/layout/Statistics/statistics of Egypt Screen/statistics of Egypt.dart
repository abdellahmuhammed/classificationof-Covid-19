// ignore_for_file: camel_case_types

import 'package:finalproject/layout/cubit/home%20cuibt/covid_home_layou_cubit.dart';
import 'package:flutter/material.dart';
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
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2
            ),
            children: <Widget>[
              defultCountainer(
                title: 'CONFIRMED',
                panelColor: Colors.red[100],
                textColor: Colors.red,
                count: "worldWide['cases'].toString()",
              ),
              defultCountainer(
                title: 'ACTIVE',
                panelColor: Colors.blue[100],
                textColor: Colors.blue[900],
                count: "worldWide['active'].toString()",
              ),
              defultCountainer(
                title: 'RECOVERD',
                panelColor: Colors.green[100],
                textColor: Colors.green,
                count: "worldWide['recovered'].toString()",
              ),
              defultCountainer(
                title: 'DEATHS',
                panelColor: Colors.grey[400],
                textColor: Colors.grey[900],
                count:" worldWide['deaths'].toString()",
              ),
            ],
          ),
        );
      },
    );
  }
}

class defultCountainer extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const defultCountainer({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);@override


  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      margin: const EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      decoration: BoxDecoration(
          color: panelColor,
          borderRadius: BorderRadius.circular(15)

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: <Widget>[
          Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: textColor
            ),
          ),
          Text(count,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: textColor
            ),
          )
        ],
      ),
    );
  }
}
