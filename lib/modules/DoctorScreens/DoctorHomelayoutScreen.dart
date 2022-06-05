// ignore_for_file: file_names, unnecessary_string_interpolations, must_be_immutable, void_checks, missing_return


import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/modules/DoctorScreens/DiagnosisScreen/DiagnosisScreen.dart';
import 'package:finalproject/modules/DoctorScreens/DoctorProfileScreen/DoctorProfileScreen.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_state.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_drop_down_menu/mk_drop_down_menu.dart';

class DoctorHomeLayoutScreen extends StatelessWidget {
  DoctorHomeLayoutScreen({Key key}) : super(key: key);
  int controller;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isBottomSheetShown = false;



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(),
            drawer: ConditionalBuilder(
              condition: PatientCubit.get(context).getPatientDataModel != null,
              builder: (BuildContext context) => defultDrawer(
                context,
                '${PatientCubit.get(context).getPatientDataModel.data[0].username}',
                PatientCubit.get(context).getPatientDataModel.data[0].phoneNum,
                DoctorProfileScreen(),
              ),
              fallback: (BuildContext context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! DoctorLoadingState,
              builder: (BuildContext context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildHomeScreen(
                    context: context,
                    index: index,
                  );
                },
                separatorBuilder: (context, index) => MyDivider(),
                itemCount: DoctorCubit.get(context).getInfectedUser.data.length,
              ),
              fallback: (BuildContext context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  NavigateTo(context, DiagnosisScreen());
                },
                child: const Icon(Icons.add)),
          );
        });
  }

  Widget buildHomeScreen({context, index}) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .16,
              width: MediaQuery.of(context).size.width * .4,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${DoctorCubit.get(context).getInfectedUser.data[index].patient}',
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${DoctorCubit.get(context).getInfectedUser.data[index].infectionDate}',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      MKDropDownMenu(
                        headerBuilder: (bool menuIsShowing) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'details',
                                  style: TextStyle(
                                    color: menuIsShowing
                                        ? Colors.blue
                                        : Colors.black,
                                    fontSize: 25,
                                  ),
                                ),
                                Icon(
                                  menuIsShowing
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                  color: menuIsShowing
                                      ? Colors.blue
                                      : Colors.black,
                                ),
                              ],
                            ),
                          );
                        },
                        menuBuilder: () {
                          return Container(
                            height: MediaQuery.of(context).size.height * .08,
                            width: MediaQuery.of(context).size.width * .5,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.withOpacity(.78),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // ct scan
                                defultMaterialButton(
                                    function: () {
                                      scaffoldKey.currentState
                                          .showBottomSheet(
                                            (context) => ListView.separated(
                                          itemBuilder: (BuildContext context, int index) => Column(
                                            children: [
                                              Image.asset('assets/images/1.png' , height: MediaQuery.of(context).size.width*.3),
                                            ],
                                          ), separatorBuilder: (BuildContext context, int index) => MyDivider(),
                                          itemCount:DoctorCubit.get(context).getInfectedUser.data[index].ctScans[0].numOfImgs,

                                        ),
                                      );

                                    },
                                    text: 'text' ,
                                    background: Colors.grey.shade200,
                                width: MediaQuery.of(context).size.width*.2,
                                  radius: 50

                                ),

                                //voting
                                MKDropDownMenu(
                                  headerBuilder: (bool menuIsShowing) {
                                    return Container(
                                      height: 40,
                                      alignment: Alignment.center,

                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            'Voting',
                                            style: TextStyle(
                                              color: menuIsShowing
                                                  ? Colors.blue
                                                  : Colors.black,
                                              fontSize: 25,



                                            ),
                                          ),
                                          Icon(
                                            menuIsShowing
                                                ? Icons.expand_less
                                                : Icons.expand_more,
                                            color: menuIsShowing
                                                ? Colors.blue
                                                : Colors.black,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  menuBuilder: () {

                                    return AlertDialog(
                                      content: Container(
                                        color: Colors.green,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [

                                            RadioListTile(
                                                title:  const Text('covid19'),
                                                value: 'covid19',
                                                groupValue:
                                                DoctorCubit.get(context)
                                                    .value,
                                                onChanged: (index1) {
                                                  DoctorCubit.get(context)
                                                      .changeRadoIndex(index1);
                                                }),
                                            RadioListTile(
                                                title: const Text('none'),
                                                value: 'none',

                                                groupValue:
                                                DoctorCubit.get(context)
                                                    .value,
                                                onChanged: (index2) {
                                                  DoctorCubit.get(context)
                                                      .changeRadoIndex(index2);
                                                }),
                                            RadioListTile(
                                                title: const Text('Pneumonia'),
                                                value: 'pneumonia',
                                                groupValue:
                                                DoctorCubit.get(context)
                                                    .value,
                                                onChanged: (index3) {
                                                  DoctorCubit.get(context)
                                                      .changeRadoIndex(index3);
                                                }),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Center(
                                              child: defultMaterialButton(
                                                  function: () {
                                                    CatchHelper.saveData(
                                                        key: 'value',
                                                        value:
                                                        DoctorCubit.get(
                                                            context)
                                                            .value)
                                                        .then((value) {
                                                      DoctorCubit.get(context)
                                                          .addVoting();

                                                      defaultFlutterToast(
                                                        msg: 'Success',
                                                        background: Colors.red,
                                                      );
                                                    });
                                                  }, // هنا هيروح فين بالظبط
                                                  text: 'Send',
                                                  background: Colors.grey
                                                      .withOpacity(.4),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      .4),
                                            ),
                                          ],
                                        ),
                                      ) ,
                                    );

                                  },
                                ),


                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  // defultMaterialButton(
                  //   function: () {
                  //     DoctorCubit.get(context).tooMany(index);
                  //   },
                  //   text: 'send',
                  // ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget X({context, index}) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RadioListTile(
                  title: const Text('covid19'),
                  value: 'covid19',
                  groupValue: DoctorCubit.get(context).value,
                  onChanged: (index) {
                    DoctorCubit.get(context).changeRadoIndex(index);
                  }),
              RadioListTile(
                  title: const Text('none'),
                  value: 'none',
                  groupValue: DoctorCubit.get(context).value,
                  onChanged: (index) {
                    DoctorCubit.get(context).changeRadoIndex(index);
                  }),
              RadioListTile(
                  title: const Text('Pneumonia'),
                  value: 'pneumonia',
                  groupValue: DoctorCubit.get(context).value,
                  onChanged: (index) {
                    DoctorCubit.get(context).changeRadoIndex(index);
                  }),
            ],
          )
        ],
      );
}
