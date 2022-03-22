
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              defultContainer(context,
                  text1: 'deaths',
                  text2: 'deaths',
                  height: MediaQuery.of(context).size.height * .2,
                  width: MediaQuery.of(context).size.width * .40,
                  color: countainerColor),
              const SizedBox(
                width: 10,
              ),
              defultContainer(context,
                  text1: 'cases',
                  text2: 'cases',
                  height: MediaQuery.of(context).size.height * .2,
                  width: MediaQuery.of(context).size.width * .40,
                  color: countainerColor),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Row(
            children: [
              defultContainer(context,
                  text1: 'Recovered',
                  text2:'recoverd',
                  height: MediaQuery.of(context).size.height * .2,
                  width: MediaQuery.of(context).size.width * .25,
                  color: countainerColor),
              SizedBox(
                width: 20,
              ),
              defultContainer(context,
                  text1: 'active',
                  text2: 'active',
                  height: MediaQuery.of(context).size.height * .2,
                  width: MediaQuery.of(context).size.width * .25,
                  color: countainerColor),
              SizedBox(
                width: 20,
              ),
              defultContainer(
                context,
                color: countainerColor,
                text1: 'todayRecovered',
                text2: 'todayReovered',
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * .25,
              ),
            ],
          )
        ],
      ),
    );
  }
}
