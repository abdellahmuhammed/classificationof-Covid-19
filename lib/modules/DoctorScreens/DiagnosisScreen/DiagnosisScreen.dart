// ignore_for_file: file_names, unnecessary_string_interpolations, must_be_immutable, void_checks, missing_return, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print
import 'dart:math' as math;
import 'package:conditional_builder/conditional_builder.dart';
import 'package:custom_full_image_screen/custom_full_image_screen.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'package:finalproject/modules/DoctorScreens/DoctorProfileScreen/DoctorProfileScreen.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_state.dart';
import 'package:finalproject/modules/DoctorScreens/patient%20details/patient%20details.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class DiagnosisScreen extends StatelessWidget {
  DiagnosisScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit()
        ..getLessPro()
        ..getUserProfile()
        ..getUserProfileTest(),
      child: BlocConsumer<DoctorCubit, DoctorState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: ConditionalBuilder(
                condition: state is! DoctorLoadingState,
                builder: (BuildContext context) => ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      subtitle: buildHomeScreen(
                        context: context,
                        index: index,
                      ),
                      onTap: () {
                        NavigateTo(
                            context,
                            PatientDetails(
                              Mo: DoctorCubit.get(context).Test.data[index],
                            ));
                      },
                    );
                  },
                  itemCount:
                      DoctorCubit.get(context).getInfectedUser.data.length,
                ),
                fallback: (BuildContext context) => const Center(
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
            );
          }),
    );
  }

  Widget buildHomeScreen({
    context,
    index,
  }) =>
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageNetworkFullscreen(
                imageUrl:
                    'https://co-cvoid-19.me/uploads/ct_scans/11_20220612_1.dcm.png' ??
                        const CircularProgressIndicator(),
                imageBorderRadius: 20,
                imageWidth: MediaQuery.of(context).size.width * .4,
                imageHeight: MediaQuery.of(context).size.height * .2,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    const SizedBox(
                      height: 10,
                    ),
                    ExpansionWidget(
                      initiallyExpanded: false,
                      titleBuilder: (double animationValue, _, bool isExpaned,
                          toogleFunction) {
                        return InkWell(
                          onTap: () => toogleFunction(animated: true),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Text(
                                  'voting ',
                                  style: Theme.of(context).textTheme.bodyText1,
                                )),
                                Transform.rotate(
                                  angle: math.pi * animationValue / 2,
                                  // السهم بيلف يدررجة كام
                                  child: const Icon(
                                    Icons.arrow_right,
                                    size: 40,
                                    color: Colors.deepOrange,
                                  ),
                                  alignment: Alignment.center,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      content: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RadioListTile(
                                title: Text(
                                  'covid19',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                value: 'covid19',
                                groupValue: DoctorCubit.get(context).value1,
                                onChanged: (index1) {
                                  DoctorCubit.get(context)
                                      .changeRadoIndex(index1);
                                }),
                            RadioListTile(
                              title: Text('none',
                                  style: Theme.of(context).textTheme.bodyText1),
                              value: 'none',
                              groupValue: DoctorCubit.get(context).value1,
                              onChanged: (index2) {
                                DoctorCubit.get(context)
                                    .changeRadoIndex(index2);
                              },
                            ),
                            RadioListTile(
                                title: Text('Pneumonia',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                value: 'pneumonia',
                                groupValue: DoctorCubit.get(context).value1,
                                onChanged: (index3) {
                                  DoctorCubit.get(context)
                                      .changeRadoIndex(index3);
                                }),
                            Center(
                              child: defultMaterialButton(
                                  radius: 20,
                                  function: () {
                                    Dialogs.materialDialog(
                                      msg: 'Are you sure to send voting',
                                      title: "Send",
                                      color: Colors.white,
                                      context: context,
                                      actions: [
                                        IconsOutlineButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          text: 'No',
                                          iconData: Icons.cancel_outlined,
                                          textStyle:
                                              TextStyle(color: Colors.grey),
                                          iconColor: Colors.grey,
                                        ),
                                        IconsButton(
                                          onPressed: () {
                                            CatchHelper.saveData(
                                                    key: 'value',
                                                    value:
                                                        DoctorCubit.get(context)
                                                            .value1)
                                                .then((value) {
                                              DoctorCubit.get(context)
                                                  .tooMany(index);
                                              defaultFlutterToast(
                                                msg: 'Send Successfully',
                                                background: Colors.green,
                                              );
                                              Navigator.pop(context);
                                            });
                                          },
                                          text: 'Yes',
                                          iconData: Icons.send,
                                          color: Colors.red,
                                          textStyle:
                                              TextStyle(color: Colors.white),
                                          iconColor: Colors.white,
                                        ),
                                      ],
                                    );
                                  },
                                  // هنا هيروح فين بالظبط
                                  text: 'Send',
                                  background: Colors.grey.withOpacity(.4),
                                  width:
                                      MediaQuery.of(context).size.width * .4),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // MKDropDownMenu(
                    //   headerBuilder: (bool menuIsShowing) {
                    //     return Container(
                    //       alignment: Alignment.center,
                    //       decoration: const BoxDecoration(
                    //         color: Colors.white,
                    //       ),
                    //       child: SingleChildScrollView(
                    //         child: Row(
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: <Widget>[
                    //             Text(
                    //               'details',
                    //               style: TextStyle(
                    //                 color: menuIsShowing
                    //                     ? Colors.blue
                    //                     : Colors.black,
                    //                 fontSize: 25,
                    //               ),
                    //             ),
                    //             Icon(
                    //               menuIsShowing
                    //                   ? Icons.expand_less
                    //                   : Icons.expand_more,
                    //               color:
                    //                   menuIsShowing ? Colors.blue : Colors.black,
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     );
                    //   },
                    //   menuBuilder: () {
                    //     return Container(
                    //       height: MediaQuery.of(context).size.height * .08,
                    //       width: MediaQuery.of(context).size.width * .5,
                    //       padding: const EdgeInsets.all(15),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(15),
                    //         color: Colors.grey.withOpacity(.78),
                    //       ),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //         children: [
                    //           // ct scan
                    //           defultMaterialButton(
                    //             function: () {
                    //               scaffoldKey.currentState.showBottomSheet(
                    //                 (context) => ListView.separated(
                    //                   itemBuilder:
                    //                       (BuildContext context, int index) =>
                    //                           Column(
                    //                     children: [
                    //                       Image.asset('assets/images/1.png',
                    //                           height: MediaQuery.of(context)
                    //                                   .size
                    //                                   .width *
                    //                               .3),
                    //                     ],
                    //                   ),
                    //                   separatorBuilder:
                    //                       (BuildContext context, int index) =>
                    //                           MyDivider(),
                    //                   itemCount: DoctorCubit.get(context)
                    //                       .getInfectedUser
                    //                       .data[index]
                    //                       .ctScans[0]
                    //                       .numOfImgs,
                    //                 ),
                    //               );
                    //             },
                    //             text: 'text',
                    //             background: Colors.grey.shade200,
                    //             width: MediaQuery.of(context).size.width * .2,
                    //             radius: 50,
                    //           ),
                    //
                    //           //voting
                    //           MKDropDownMenu(
                    //             headerBuilder: (bool menuIsShowing) {
                    //               return Container(
                    //                 height: 100,
                    //                 alignment: Alignment.center,
                    //                 child: Row(
                    //                   mainAxisSize: MainAxisSize.min,
                    //                   children: <Widget>[
                    //                     Text(
                    //                       'Voting',
                    //                       style: TextStyle(
                    //                         color: menuIsShowing
                    //                             ? Colors.blue
                    //                             : Colors.black,
                    //                         fontSize: 25,
                    //                       ),
                    //                     ),
                    //                     Icon(
                    //                       menuIsShowing
                    //                           ? Icons.expand_less
                    //                           : Icons.expand_more,
                    //                       color: menuIsShowing
                    //                           ? Colors.blue
                    //                           : Colors.black,
                    //                     ),
                    //                   ],
                    //                 ),
                    //               );
                    //             },
                    //             menuBuilder: () {
                    //               return AlertDialog(
                    //                 content: Container(
                    //                   color: Colors.green,
                    //                   child: SingleChildScrollView(
                    //                     child: Column(
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       children: [
                    //                         RadioListTile(
                    //                             title: const Text('covid19'),
                    //                             value: 'covid19',
                    //                             groupValue:
                    //                                 DoctorCubit.get(context)
                    //                                     .value,
                    //                             onChanged: (index1) {
                    //                               DoctorCubit.get(context)
                    //                                   .changeRadoIndex(index1);
                    //                             }),
                    //                         RadioListTile(
                    //                           title: const Text('none'),
                    //                           value: 'none',
                    //                           groupValue:
                    //                               DoctorCubit.get(context).value,
                    //                           onChanged: (index2) {
                    //                             DoctorCubit.get(context)
                    //                                 .changeRadoIndex(index2);
                    //                           },
                    //                         ),
                    //                         RadioListTile(
                    //                             title: const Text('Pneumonia'),
                    //                             value: 'pneumonia',
                    //                             groupValue:
                    //                                 DoctorCubit.get(context)
                    //                                     .value,
                    //                             onChanged: (index3) {
                    //                               DoctorCubit.get(context)
                    //                                   .changeRadoIndex(index3);
                    //                             }),
                    //                         const SizedBox(
                    //                           height: 15,
                    //                         ),
                    //                         Center(
                    //                           child: defultMaterialButton(
                    //                               function: () {
                    //                                 CatchHelper.saveData(
                    //                                         key: 'value',
                    //                                         value:
                    //                                             DoctorCubit.get(
                    //                                                     context)
                    //                                                 .value)
                    //                                     .then((value) {
                    //                                   DoctorCubit.get(context)
                    //                                       .addVoting();
                    //
                    //                                   defaultFlutterToast(
                    //                                     msg: 'Success',
                    //                                     background: Colors.red,
                    //                                   );
                    //                                 });
                    //                               }, // هنا هيروح فين بالظبط
                    //                               text: 'Send',
                    //                               background:
                    //                                   Colors.grey.withOpacity(.4),
                    //                               width: MediaQuery.of(context)
                    //                                       .size
                    //                                       .width *
                    //                                   .4),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ),
                    //               );
                    //             },
                    //           ),
                    //         ],
                    //       ),
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
