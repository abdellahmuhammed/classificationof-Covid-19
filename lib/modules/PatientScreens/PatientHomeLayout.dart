// ignore_for_file: unrelated_type_equality_checks

import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/modules/DoctorScreens/DoctorProfileScreen/DoctorProfileScreen.dart';
import 'package:finalproject/modules/PatientScreens/PatientProfile/PatientProfile.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_state.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientHomeLayoutScreen extends StatelessWidget {
   PatientHomeLayoutScreen({Key key}) : super(key: key);
List <dynamic> patientList =[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientStates>(
      listener: (context, state) {
        },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          drawer: ConditionalBuilder(
            condition: state is ! LoadingGetPatientDataState,
            builder: (BuildContext context) =>
                defultDrawer(
                  context,
                  PatientCubit.get(context).getPatientDataModel.data[0].username ,
                  PatientCubit.get(context).getPatientDataModel.data[0].phoneNum,
                  PatientProfileScreen(),
                ),
            fallback: (BuildContext context) =>
            const Center(
              child: CircularProgressIndicator(),),
          ),
          floatingActionButton: FloatingActionButton(child: const Icon(Icons.add),onPressed: (){
            PatientCubit.get(context).getUserProfile();
          },),
        );
      },
    );
  }
}
