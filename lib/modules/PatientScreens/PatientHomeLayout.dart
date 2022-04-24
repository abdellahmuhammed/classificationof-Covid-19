import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/modules/DoctorScreens/DoctorProfileScreen/DoctorProfileScreen.dart';
import 'package:finalproject/modules/PatientScreens/PatientProfile/PatientProfile.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';

class PatientHomeLayoutScreen extends StatelessWidget {
  const PatientHomeLayoutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: ConditionalBuilder(
        condition: true,
        builder: (BuildContext context)=> defultDrawer(
          context,
          'cubit.getInfectedUser.data[0].doctor',
          1234563,
          PatientProfileScreen(),
        ),
        fallback: (BuildContext context)=> const Center(
          child:CircularProgressIndicator(),),
      ),
    );
  }
}
