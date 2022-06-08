// ignore_for_file: unrelated_type_equality_checks

import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/layout/cubit/DarkMode/dark_mode_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/DoctorProfileScreen/DoctorProfileScreen.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_cubit.dart';
import 'package:finalproject/modules/PatientScreens/PatientProfile/PatientProfile.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_state.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

class PatientHomeLayoutScreen extends StatelessWidget {
  PatientHomeLayoutScreen({Key key}) : super(key: key);
  List<dynamic> patientList = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  DarkModeCubit.get(context).changeAppMode();
                },
                icon: const Icon(Icons.dark_mode),
              ),
            ],
          ),
          drawer: ConditionalBuilder(
            condition: state is! LoadingGetPatientDataState,
            builder: (BuildContext context) => defultDrawer(
              context,
              PatientCubit.get(context).getPatientDataModel.data[0].username,
              PatientCubit.get(context).getPatientDataModel.data[0].phoneNum,
              PatientProfileScreen(),
            ),
            fallback: (BuildContext context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          // body: Center(
          //   child: ClipPolygon(
          //     sides: 6,
          //     borderRadius: 5.0,
          //     // Default 0.0 degrees
          //     rotate: 90.0,
          //     // Default 0.0 degrees
          //     boxShadows: [
          //       PolygonBoxShadow(color: Colors.black, elevation: 1.0),
          //       PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
          //     ],
          //     child: Container(
          //       color: Colors.blueGrey ,
          //       child: Column(
          //         children: [
          //           Text('kkkk ' , style: TextStyle(color: Colors.white),)
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              PatientCubit.get(context).getUserProfile();
            },
          ),
        );
      },
    );
  }
}
