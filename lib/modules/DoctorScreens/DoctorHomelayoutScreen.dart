// ignore_for_file: file_names, unnecessary_string_interpolations, must_be_immutable, void_checks

import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/modules/DoctorScreens/DiagnosisScreen/DiagnosisScreen.dart';
import 'package:finalproject/modules/DoctorScreens/DoctorProfileScreen/DoctorProfileScreen.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_state.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorHomeLayoutScreen extends StatelessWidget {
   DoctorHomeLayoutScreen({Key key}) : super(key: key);
int controller;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
        listener: (context, state) {


        },
        builder: (context, state) {


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

                  itemBuilder: (context, index) {

                    return buildHomeScreen(context: context, index: index ,);





                    },
                  separatorBuilder: (context, index) => MyDivider(),
                  itemCount:DoctorCubit.get(context).getInfectedUser.data.length,
              ),
              fallback: (BuildContext context)=> const Center(child: CircularProgressIndicator(),),

            ),

            floatingActionButton: FloatingActionButton(
              onPressed: () {
               NavigateTo(context, DiagnosisScreen());
              },
              child: const Icon(Icons.add)
            ),
          );
        });
  }

  Widget buildHomeScreen({context, index }) => Padding(
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
             defultMaterialButton(function: (){
               DoctorCubit.get(context).tooMany(index);
             }, text: 'send')
            ],
          ),
        ),
      ],
    ),
  );
  Widget Buton({context,index})=>Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
        ],
      )

    ],

  );




}
