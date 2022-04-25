import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/modules/PatientScreens/PatientProfile/PatientProfile.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/modules/RadiologistScreen/cubit/radiologist_cubit.dart';
import 'package:finalproject/modules/Screens/LoginScreen/Login_Screen.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../DoctorScreens/DoctorProfileScreen/DoctorProfileScreen.dart';

class RadiologistHomeLayoutScreen extends StatelessWidget {
  const RadiologistHomeLayoutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RadiologistCubit, RadiologistState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          drawer: ConditionalBuilder(
            condition: true,
            builder: (BuildContext context)=> defultDrawer(
              context,
              'cubit.getInfectedUser.data[0].doctor',
              4568,
              DoctorProfileScreen(),
            ),
            fallback: (BuildContext context) => const Center(
              child:CircularProgressIndicator(),),
          ),
          floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
            PatientCubit.get(context).getUserProfile();

          },),
        );
      },
    );
  }
}
