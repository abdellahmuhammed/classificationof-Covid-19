// ignore_for_file: must_be_immutable, file_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:finalproject/layout/cubit/DoctorCubit/doctor_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/CTScanScreen/CTScanScreen.dart';
import 'package:finalproject/modules/DoctorScreens/DiagnosisScreen/DiagnosisScreen.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientDetails extends StatelessWidget {
  PatientDetails({Key key}) : super(key: key);

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
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .16,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              // ct scan image
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .04,
                          color: Colors.grey.withOpacity(.6),
                          child: TextButton(
                            onPressed: () {
                              NavigateTo(context, const CTScanScreen());
                            },
                            child:  Text(
                              'Show More CT Scan',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Personal Information',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    buildPersonalInformation(context),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(height: 15,),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                NavigateTo(context,  DiagnosisScreen());
              },
              label: const Text('diagnose the Patient'),
              icon: const Icon(Icons.send),
              backgroundColor: Colors.grey.withOpacity(.6),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          ),
        );
      },
    );
  }

  Widget buildPersonalInformation(context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'user name',
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
                  label: 'user name',
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
                    label: 'email'),
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
                    label: 'phone'),
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
                    label: 'National ID'),
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
                    label: 'job'),
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
                    label: 'address'),
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
                    label: 'dob'),
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
                    label: 'gender'),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      );

  Widget buildRadioButtonItem({context}) => DropdownButton2(
        hint: Text(
          'Select diagnosis',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: DoctorCubit.get(context)
            .items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: DoctorCubit.get(context)..selectedValue,
        onChanged: (value) {
          DoctorCubit.get(context).selectedValue = value as String;
        },
        buttonHeight: 40,
        buttonWidth: 140,
        itemHeight: 40,
      );
}
