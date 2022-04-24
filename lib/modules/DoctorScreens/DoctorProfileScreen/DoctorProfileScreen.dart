// ignore_for_file: must_be_immutable, file_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_state.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorProfileScreen extends StatelessWidget {
  DoctorProfileScreen({Key key}) : super(key: key);

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
              padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      'Personal Information',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    buildPersonalInformation(context),
                  ],
                ),
              ),
            ),
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
                'Doctor name',
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
                  label: 'Dr',
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
