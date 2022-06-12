// ignore_for_file: unrelated_type_equality_checks, prefer_const_constructors_in_immutables, camel_case_types

import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/layout/cubit/DarkMode/dark_mode_cubit.dart';
import 'package:finalproject/models/infectedData/infectedModel.dart';
import 'package:finalproject/modules/PatientScreens/PatientProfile/PatientProfile.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_state.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class patientStetues extends StatelessWidget {
  patientStetues({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(

          body:ConditionalBuilder(
            condition: PatientCubit.get(context).InfModel !=null,
            builder:(context)=>BuildResult(context,PatientCubit.get(context).InfModel) ,
            fallback: (context)=>Center(child: CircularProgressIndicator()),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              PatientCubit.get(context).getStatueOfUser();
            },
          ),
          floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,

        );
      },
    );
  }
  Widget BuildResult(BuildContext context,InfectedModel model){
    return Center(
      child: Container(
        color: Colors.grey ,
        width: MediaQuery.of(context).size.width*.7,
        height: MediaQuery.of(context).size.height*.5,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(300),
            clipBehavior: Clip.hardEdge,
            child: Center(child: Text('The Result is   ${model.data[PatientCubit.get(context).InfModel.data.length-1].status}'))),
      ),
    );
  }
}
