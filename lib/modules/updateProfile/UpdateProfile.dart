import 'package:finalproject/layout/cubit/Covid_19App/covid_19_app_cubit.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class UpdateProfileScreen extends StatelessWidget {
   UpdateProfileScreen({Key key}) : super(key: key);
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Covid19AppCubit, Covid19AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = Covid19AppCubit.get(context);
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
                    Text('Create your account ',
                        style: Theme.of(context).textTheme.bodyText1),
                    const SizedBox(
                      height: 20,
                    ),
                    // userName
                    defultTextFormFiled(
                      context,
                      controller: usernameController,
                      type: TextInputType.name,
                      label: 'Enter UserName',
                      prefixIcon: Icons.person,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return ' UserName most not be empty';
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
                              print('Registering is done');
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
