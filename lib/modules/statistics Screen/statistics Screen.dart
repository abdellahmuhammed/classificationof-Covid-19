// ignore_for_file: must_be_immutable, file_names

import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget
{
  StatisticsScreen({Key key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool egyptShowBottomSheet = false;
  bool worldShowBottomSheet = false;
  TextStyle style;

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              if (egyptShowBottomSheet) {
                Navigator.pop(context);
                egyptShowBottomSheet = false;
                worldShowBottomSheet = true;
                style = style;
              } else {
                scaffoldKey.currentState
                    .showBottomSheet(
                      (context) => Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20)),
                          height: MediaQuery.of(context).size.height * .7,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'Statistics Of Egypt',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  defultContainer(context,
                                      text1: 'cases',
                                      text2: 'cases',
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .2,
                                      width: MediaQuery.of(context).size.width *
                                          .40,
                                      color: countainerColor),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  defultContainer(context,
                                      text1: 'today Cases',
                                      text2: 'today Cases',
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .2,
                                      width: MediaQuery.of(context).size.width *
                                          .40,
                                      color: countainerColor),
                                ],
                              ),
                              const SizedBox(
                                height: 70,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    defultContainer(context,
                                        text1: 'active',
                                        text2: 'active',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .20,
                                        color: countainerColor),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    defultContainer(context,
                                        text1: 'Recovered',
                                        text2: 'recovered',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .25,
                                        color: countainerColor),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    defultContainer(
                                      context,
                                      color: countainerColor,
                                      text1: 'Deaths',
                                      text2: 'deaths',
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .2,
                                      width: MediaQuery.of(context).size.width *
                                          .25,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .closed
                    .then((value) {
                  {
                    egyptShowBottomSheet = false;
                    worldShowBottomSheet = true;
                    style = style;
                  }
                });
                egyptShowBottomSheet = true;
                worldShowBottomSheet = false;
                style = const TextStyle(
                    color: Colors.blue,
                    backgroundColor: Colors.green,
                    fontSize: 25);
              }
            },
            child: Text(
              'Egypt',
              style: style,
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          TextButton(
            onPressed: () {
              if (worldShowBottomSheet) {
                Navigator.pop(context);
                worldShowBottomSheet = false;
                egyptShowBottomSheet = true;
                style = style;
              } else {
                scaffoldKey.currentState
                    .showBottomSheet(
                      (context) => Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20)),
                          height: MediaQuery.of(context).size.height * .7,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'Statistics Of World',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  defultContainer(context,
                                      text1: 'cases',
                                      text2: 'cases',
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .2,
                                      width: MediaQuery.of(context).size.width *
                                          .40,
                                      color: countainerColor),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  defultContainer(context,
                                      text1: 'today Cases',
                                      text2: 'today Cases',
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .2,
                                      width: MediaQuery.of(context).size.width *
                                          .40,
                                      color: countainerColor),
                                ],
                              ),
                              const SizedBox(
                                height: 70,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    defultContainer(context,
                                        text1: 'active',
                                        text2: 'active',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .20,
                                        color: countainerColor),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    defultContainer(context,
                                        text1: 'Recovered',
                                        text2: 'recovered',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .25,
                                        color: countainerColor),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    defultContainer(
                                      context,
                                      color: countainerColor,
                                      text1: 'Deaths',
                                      text2: 'deaths',
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .2,
                                      width: MediaQuery.of(context).size.width *
                                          .25,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .closed
                    .then((value) {
                  {
                    worldShowBottomSheet = false;
                    egyptShowBottomSheet = true;
                    style = style;
                  }
                });
                worldShowBottomSheet = true;
                egyptShowBottomSheet = false;
                style = const TextStyle(
                    color: Colors.blue,
                    backgroundColor: Colors.green,
                    fontSize: 25);
              }
            },
            child: Text(
              'World',
              style: style,
            ),
          ),
          //             AwesomeDialog (
          // context: context,
          // dialogType: DialogType.INFO,
          // animType: AnimType.BOTTOMSLIDE,
          // title: 'Dialog Title',
          // desc: 'Dialog description here.............',
          // btnCancelOnPress: () {},
          // btnOkOnPress: () {},
          // )..show(),
        ],
      ),
    );
  }
}
