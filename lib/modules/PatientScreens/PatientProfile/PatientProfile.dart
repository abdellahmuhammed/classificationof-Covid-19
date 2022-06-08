// ignore_for_file: must_be_immutable, file_names

import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/modules/PatientScreens/UserEmergency/UserEmergency.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_state.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientProfileScreen extends StatelessWidget {
  PatientProfileScreen({Key key}) : super(key: key);

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var genderController = TextEditingController();
  var ssnController = TextEditingController();
  var dobController = TextEditingController();
  var addressController = TextEditingController();
  var jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: ConditionalBuilder(
              condition: state is ! LoadingGetPatientDataState ,
              builder: (BuildContext context) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            'Personal Information',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const Spacer(),
                          Text(
                            'Edit',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          defaultLaunchRrl(icon: Icons.edit, Url: 'https://t.me/+201126017421')
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      buildPersonalInformation(context),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                          onPressed: (){
                            NavigateTo(context, UserEmergencyScreen());
                          },
                          child: Text('User Emergency Contact')
                      ),
                      const SizedBox(height: 15,),
                    ],
                  ),
                ),
              ),
              fallback:  (BuildContext context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildPersonalInformation (context) => Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ' user name ',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * .046,
            child: defultTextFormFiled(
              context,
              controller: userNameController,
              prefixIcon: Icons.person,
              validate: null,
              enabled: false,
              type: null,
              label: PatientCubit.get(context).getPatientDataModel.data[0].username,
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'email',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * .046,
            child: defultTextFormFiled(context,
                controller: emailController,
                prefixIcon: Icons.person,
                validate: null,
                enabled: false,
                type: null,
                label: PatientCubit.get(context).getPatientDataModel.data[0].email
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'phone',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * .046,
            child: defultTextFormFiled(context,
                controller: phoneController,
                prefixIcon: Icons.person,
                validate: null,
                enabled: false,
                type: null,
                label: '${PatientCubit.get(context).getPatientDataModel.data[0].phoneNum}',
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'National ID',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * .046,
            child: defultTextFormFiled(context,
                controller: ssnController,
                prefixIcon: Icons.person,
                validate: null,
                enabled: false,
                type: null,
                label: '${PatientCubit.get(context).getPatientDataModel.data[0].ssn}',
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'job',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * .046,
            child: defultTextFormFiled(context,
                controller: jobController,
                prefixIcon: Icons.person,
                validate: null,
                enabled: false,
                type: null,
                label:'66',
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'address',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * .046,
            child: defultTextFormFiled(context,
                controller: addressController,
                prefixIcon: Icons.person,
                validate: null,
                enabled: false,
                type: null,
                label: '8',
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'dob',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * .046,
            child: defultTextFormFiled(context,
                controller: dobController,
                prefixIcon: Icons.person,
                validate: null,
                enabled: false,
                type: null,
                label: '7'
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'gender',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * .046,
            child: defultTextFormFiled(context,
                controller: genderController,
                prefixIcon: Icons.person,
                validate: null,
                enabled: false,
                type: null,
                label:PatientCubit.get(context).getPatientDataModel.data[0].gender
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
    ],
  );
}
