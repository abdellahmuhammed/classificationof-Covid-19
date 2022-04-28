// ignore_for_file: file_names, unnecessary_string_interpolations

import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/modules/DoctorScreens/DiagnosisScreen/DiagnosisScreen.dart';
import 'package:finalproject/modules/DoctorScreens/DoctorProfileScreen/DoctorProfileScreen.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_state.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorHomeLayoutScreen extends StatelessWidget {
  const DoctorHomeLayoutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit= DoctorCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            drawer: ConditionalBuilder(
              condition: PatientCubit.get(context).getPatientDataModel != null,
              builder: (BuildContext context)=> defultDrawer(
                context,
                '${PatientCubit.get(context).getPatientDataModel.data[0].username}',
                PatientCubit.get(context).getPatientDataModel.data[0].phoneNum,
                DoctorProfileScreen(),
              ),
              fallback: (BuildContext context)=> const Center(
                child:CircularProgressIndicator(),),
            ),
            body: ConditionalBuilder(
              condition: state is ! DoctorLoadingState,
              builder: (BuildContext context)=>ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildHomeScreen(context: context, index: index ,),
                  separatorBuilder: (context, index) => MyDivider(),
                  itemCount:cubit.getInfectedUser.data.length,
              ),
              fallback: (BuildContext context)=> const Center(child: CircularProgressIndicator(),),

            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                DoctorCubit.get(context).addVoting();
              },
              child: const Icon(Icons.add)
            ),
          );
        });
  }

  Widget buildHomeScreen({context, index }) => InkWell(
        onTap: () {
          NavigateTo(context, DiagnosisScreen());
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .16,
                width: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15.0)),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${DoctorCubit.get(context).getInfectedUser.data[index].patient}',
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${DoctorCubit.get(context).getInfectedUser.data[index].infectionDate}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
