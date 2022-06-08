import 'package:finalproject/layout/cubit/DarkMode/dark_mode_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_cubit.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParamedicHomeLayoutScreen extends StatelessWidget {
  const ParamedicHomeLayoutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
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
          body: Center(
            child: Column(
              children: [
                Text('statues'),
                Text(DoctorCubit.get(context).getInfectedUser.data[0].status),


              ],
            ),
          ),
        );
      },
    );
  }
}
