// ignore_for_file: must_be_immutable

import 'package:finalproject/modules/DoctorScreens/DoctorHomelayoutScreen.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_state.dart';
import 'package:finalproject/shared/component.dart';
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
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg',
                  height: MediaQuery.of(context).size.height * .5,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'user name',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        height: MediaQuery.of(context).size.height * .046,
                        child: defultTextFormFiled(
                          context,
                          controller: userNameController,
                          prefixIcon: Icons.person,
                          enabled: false,
                          validate: null,
                          type: null,
                          label: 'user name',
                        ),
                      ),
                    ],
                  ),
                ),
                RadioListTile(
                    title: const Text('covid19'),
                    value: 1,
                    groupValue: DoctorCubit.get(context).value,
                    onChanged: (index) {
                      DoctorCubit.get(context).changeRadoIndex(index);
                    }),
                RadioListTile(
                    title: const Text('Uninfected'),
                    value: 2,
                    groupValue: DoctorCubit.get(context).value,
                    onChanged: (index) {
                      DoctorCubit.get(context).changeRadoIndex(index);
                    }),
                RadioListTile(
                    title: const Text('Pneumonia'),
                    value: 3,
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
                        defaultFlutterToast(
                            msg: 'Diagnosis done successfully',
                            background: Colors.grey);
                        NavigateAndRemove(
                            context, const DoctorHomeLayoutScreen());
                      }, // هنا هيروح فين بالظبط
                      text: 'Send',
                      background: Colors.grey.withOpacity(.4),
                      width: MediaQuery.of(context).size.width * .4),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
