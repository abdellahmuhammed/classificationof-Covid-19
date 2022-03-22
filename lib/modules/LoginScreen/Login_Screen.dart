// ignore_for_file: non_constant_identifier_names, must_be_immutable, unrelated_type_equality_checks

import 'package:finalproject/layout/cubit/Covid_19App/covid_19_app_cubit.dart';
import 'package:finalproject/modules/RegisterScreen/RegisterScreen.dart';
import 'package:finalproject/modules/forgetPassword/ForgetPassword_Screen.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeLoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
            top: 50, start: 20, end: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: Colors.white24.withOpacity(.25),
                image: const DecorationImage(
                  image: AssetImage('assets/images/4.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'Welcome Lets Start',
                style: TextStyle(
                    //  Theme.of(context).textTheme.bodyText1 ,
                    color: black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                defultMaterialButton(
                  background: Colors.grey.withOpacity(.5),
                  function: () {
                    NavigateTo(context, Covid19LoginScreen());
                  },
                  text: 'Login',
                ),
                defultMaterialButton(
                  background: Colors.grey.withOpacity(.5),
                  function: () {
                    NavigateTo(context, RegisterScreen());
                  },
                  text: 'Register',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Covid19LoginScreen extends StatelessWidget {

  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Covid19AppCubit, Covid19AppStates>(

      listener: (context, state)
      {
        if(state is PostDataSuccessState){
          if(state.loginModel.data==2){
            NavigateTo(context, ForgetPasswordScreen());

          }

        }
        // if(state is PostDataSuccessState)
        // {
        //   if (state.loginModel.success != null)
        //   {
        //     Fluttertoast.showToast(
        //         msg: state.loginModel.success,
        //         toastLength: Toast.LENGTH_LONG,
        //         gravity: ToastGravity.BOTTOM,
        //         backgroundColor: Colors.blue,
        //         textColor: Colors.black,
        //         fontSize: 16.0
        //     );
        //   }
        //    else
        //    {
        //     Fluttertoast.showToast(
        //         msg: "This is error",
        //         toastLength: Toast.LENGTH_LONG,
        //         gravity: ToastGravity.BOTTOM,
        //         backgroundColor: Colors.grey,
        //         textColor: Colors.black,
        //         fontSize: 16.0
        //     );
        //   }
        // }

      },
      builder: (context, state) {
        var cubit = Covid19AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding
            (
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: FormKey,
                child: Column(
                  children: [
                    defultImage(
                      Image: const AssetImage('assets/images/2.png'),
                      color: Colors.white24.withOpacity(.25),
                      radius: 25,
                      height: MediaQuery.of(context).size.height * .4,
                      width: MediaQuery.of(context).size.width * 1,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      ' any text here',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defultTextFormFiled(context,
                        controller: EmailController,
                        type: TextInputType.emailAddress,
                        label: 'Enter your Email',
                        prefixIcon: Icons.email,
                        validate: (String Value) {
                          if (Value.isEmpty) {
                            return 'Email must not be Empty';
                          } else {
                            return null;
                          }
                        },
                        radius: 15),

                    const SizedBox(
                      height: 20,
                    ),
                    defultTextFormFiled(context,
                      radius: 15,
                      controller: PasswordController,
                      type: TextInputType.visiblePassword,
                      label: 'Enter your Password',
                      prefixIcon: Icons.lock,
                      isPassword: cubit.isPassword,
                      suffixIcon: cubit.isPassword ? Icons.visibility :Icons.visibility_off  ,
                      onPressed: (){
                        cubit.ChangeShowPassword();
                        },
                      validate: (String Value) {
                        if (Value.isEmpty) {
                          return 'Password must not be Empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        defultTextButton(context, function: () {
                          NavigateTo(context, ForgetPasswordScreen());
                        }, text: 'Forget your password?', color: black),
                      ],
                    ),

                    // MaterialButton(
                    //     onPressed:(){
                    //       if (FormKey.currentState.validate())
                    //     {
                    //       Covid19AppCubit.get(context).postdata(
                    //       EmailController.text, PasswordController.text);
                    //
                    //     }
                    //     },
                    //   child: Text('hhhh'),
                    //       ),
                    defultMaterialButton(
                      background: Colors.grey.withOpacity(.5),
                      function: () {
                        if (FormKey.currentState.validate()){
                         Covid19AppCubit.get(context).postdata(EmailController.text, PasswordController.text,context );

                        }
                        if(cubit.roleId==2){
                          NavigateTo(context,ForgetPasswordScreen() );
                        }
                      },
                      text: 'Login',
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
