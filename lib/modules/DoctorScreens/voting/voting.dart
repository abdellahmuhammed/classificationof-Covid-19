// ignore_for_file: missing_return, camel_case_types, prefer_const_constructors, non_constant_identifier_names

import 'package:custom_full_image_screen/custom_full_image_screen.dart';
import 'package:finalproject/models/infectedData/infectedModel.dart';
import 'package:finalproject/modules/DoctorScreens/DiagnosisScreen/DiagnosisScreen.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_state.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class votingScreen extends StatelessWidget {
  const votingScreen({Key key, this.A7a}) : super(key: key);
  final Data A7a;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit , DoctorState>(
      listener: (context , state){},
      builder:(context , state){
       return Scaffold(
          appBar: AppBar(),
          body:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageNetworkFullscreen(
                imageUrl:
                'https://co-cvoid-19.me/uploads/ct_scans/11_20220612_1.dcm.png' ,
                imageBorderRadius: 20,
                imageWidth: MediaQuery.of(context).size.width * 6,
                imageHeight: MediaQuery.of(context).size.height * .4,
              ),
              const SizedBox(height: 30,),
              Card(
                elevation: 5,

                child: Column(
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
                  ],
                ),
              ),
              SizedBox(height: 20,),
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
                                DoctorCubit.get(context).addVoting(infectedId:A7a.iD );
                                defaultFlutterToast(
                                  msg: 'Send Successfully',
                                  background: Colors.green,
                                );
                                NavigateTo(context, DiagnosisScreen());
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
        );
      } ,
    );
  }
}
