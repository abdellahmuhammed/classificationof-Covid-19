// ignore_for_file: unrelated_type_equality_checks, prefer_const_constructors_in_immutables, camel_case_types, unnecessary_const, sized_box_for_whitespace, non_constant_identifier_names, prefer_const_constructors

import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/models/infectedData/infectedModel.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_up_animation/show_up_animation.dart';

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
            fallback: (context)=>const Center(child: const CircularProgressIndicator()),
          ),
          floatingActionButton: Container(
            width: MediaQuery.of(context).size.width*.7,
            height: MediaQuery.of(context).size.height*.09,
            child: FloatingActionButton(
              isExtended:true,
              child:  Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                    children:  [
                      const Icon(Icons.dangerous),
                      const SizedBox(width: 15,),
                      Text('dangerous condition' , style: Theme.of(context).textTheme.bodyText1,  ),
                    ],
                  ),
              ),

              onPressed: (){

              },
            ),
          ),
          floatingActionButtonLocation:FloatingActionButtonLocation.miniCenterDocked,


        );
      },
    );
  }
  Widget BuildResult(BuildContext context,InfectedModel model){
    return Center(
      child: Container(
        //color: Colors.grey ,
        width: MediaQuery.of(context).size.width*.7,
        height: MediaQuery.of(context).size.height*.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(300),
            clipBehavior: Clip.hardEdge,
            child: ShowUpAnimation(
              delayStart: Duration(seconds: 1),
              animationDuration: Duration(seconds: 1),
              curve: Curves.bounceIn,
              direction: Direction.vertical,
              offset: 0.5,
              child: Center(child: Text(
                  'The Result is   ${model.data[PatientCubit.get(context).InfModel.data.length-1].status}',
                      style:Theme.of(context).textTheme.bodyText1,


              )))),



      ),
    );
  }
}
