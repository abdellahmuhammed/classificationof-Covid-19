// ignore_for_file: must_be_immutable

import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_state.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiagnosisScreen extends StatelessWidget {
  DiagnosisScreen({Key key}) : super(key: key);

  var userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {

      },
      builder: (context, state) {

        return SafeArea(
          child: Scaffold(
            body: ConditionalBuilder(
              condition: state is  ! DoctorLoadingState,
              builder: (BuildContext context) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg',
                    height: MediaQuery.of(context).size.height * .5,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
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
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: defultMaterialButton(
                        function: () {

                          CatchHelper.saveData(key: 'value', value: DoctorCubit.get(context).value).then((value) {
                            DoctorCubit.get(context).addVoting();

                            defaultFlutterToast(
                              msg: 'Success',
                              background: Colors.red,
                            );
                          });
                        }, // هنا هيروح فين بالظبط
                        text: 'Send',
                        background: Colors.grey.withOpacity(.4),
                        width: MediaQuery.of(context).size.width * .4),
                  ),
                ],
              ),
              fallback: (BuildContext context) => const Center(child: CircularProgressIndicator(),),
            ),

          ),
        );
      },
    );
  }
}
