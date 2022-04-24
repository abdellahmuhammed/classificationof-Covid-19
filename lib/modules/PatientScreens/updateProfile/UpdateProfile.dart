// ignore_for_file: must_be_immutable

import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_state.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileScreen extends StatelessWidget {
   UpdateProfileScreen({Key key}) : super(key: key);
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = PatientCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: FormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Update your account ',
                        style: Theme.of(context).textTheme.bodyText1),
                    const SizedBox(
                      height: 20,
                    ),
                    // userName
                    defultTextFormFiled(
                      context,
                      controller: usernameController,
                      type: TextInputType.name,
                      label: 'Insert User Name',
                      prefixIcon: Icons.person,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return ' User Name most not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // email
                    defultTextFormFiled(
                      context, controller: emailController,
                      type: TextInputType.emailAddress,
                      label: 'Enter your email',
                      prefixIcon: Icons.email,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return ' Email must not be Empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // phone
                    defultTextFormFiled(
                      context, controller: phoneController,
                      type: TextInputType.phone,
                      label: 'Enter your phone',
                      prefixIcon: Icons.phone,
                      maxLength: 11,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return ' phone must not be Empty';
                        } else if (value.length < 11) {
                          {
                            return ' phone is shortest';
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: defultMaterialButton(
                          function: () {
                            if (FormKey.currentState.validate()) {
                              print('Update is done');
                            }
                          },
                          background: grey.withOpacity(.25),
                          text: 'Update'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}

