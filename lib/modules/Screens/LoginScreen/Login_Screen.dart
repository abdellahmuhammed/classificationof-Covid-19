// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, file_names
import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/modules/DoctorScreens/DoctorHomelayoutScreen.dart';
import 'package:finalproject/modules/ParamedicScreen/paramedicHomeLayout.dart';
import 'package:finalproject/modules/PatientScreens/PatientHomeLayout.dart';
import 'package:finalproject/modules/RadiologistScreen/RadiologistHomeLayout.dart';
import 'package:finalproject/modules/Screens/LoginScreen/cubit/user_login_cubit.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserLoginCubit(),
      child: BlocConsumer<UserLoginCubit, UserLoginState>(
        listener: (context, state) {
          if (state is UserLoginSuccess) {
            if (state.userLoginModel.success) {
              // saving token
              CatchHelper.saveData(
                  key: 'token', value: state.userLoginModel.token).then((value) => {
                token = state.userLoginModel.token,
                printFullText('token saving successfully'),
                printFullText('token is ${state.userLoginModel.token}'),
              });
              // saving user id
              CatchHelper.saveData(
                      key: 'userid', value: state.userLoginModel.userId).then((value)
              {
                printFullText('UsrId  saving successfully');
                printFullText('userId is ${state.userLoginModel.userId}');
                userid = state.userLoginModel.userId;
                if (state.userLoginModel.userId != null) {
                  if (state.userLoginModel.roleId == 2) {
                    NavigateAndRemove(context, const RadiologistHomeLayoutScreen());
                  } else if (state.userLoginModel.roleId == 3) {
                    NavigateAndRemove(context, const DoctorHomeLayoutScreen());
                  } else if (state.userLoginModel.roleId == 4) {
                    NavigateAndRemove(context, const PatientHomeLayoutScreen());
                  } else if (state.userLoginModel.roleId == 5) {
                    NavigateAndRemove(context, const ParamedicHomeLayoutScreen());
                  }
                }
                defaultFlutterToast(
                    msg: 'Login successfully', background: Colors.greenAccent);
              });
              // saving Rol Id
              CatchHelper.saveData(
                  key: 'RolId', value: state.userLoginModel.roleId).then((value) => {
                    RolId = state.userLoginModel.roleId,
              printFullText('RolId  saving successfully'),
                  printFullText('RolId is ${state.userLoginModel.roleId}'),
              });

            }
            else
            {
              defaultFlutterToast(
                  msg: 'Wrong Email or Password', background: Colors.red);
            }
          }
        },
        builder: (context, state) {
          var cubit = UserLoginCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      defultImage(
                        Image: const AssetImage('assets/images/2.png'),
                        color: Colors.white24.withOpacity(.25),
                        radius: 25,
                        ContainerHeight:
                            MediaQuery.of(context).size.height * .35,
                        ContainerWidth: MediaQuery.of(context).size.width * 1,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        ' Login',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defultTextFormFiled(context,
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'Insert your email',
                          prefixIcon: Icons.email, validate: (String value) {
                        if (value.isEmpty) {
                          return 'please Insert your email';
                        } else {
                          return null;
                        }
                      }, radius: 15),
                      const SizedBox(
                        height: 20,
                      ),
                      defultTextFormFiled(
                        context,
                        radius: 15,
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        label: 'Insert your Password',
                        prefixIcon: Icons.lock,
                        isPassword: cubit.isPassword,
                        suffixIcon: cubit.isPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        suffixPressed: () {
                          cubit.changeShowPassword();
                        },
                        onSubmit: (String value) {
                          if (formKey.currentState.validate()) {
                            UserLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                          } else {
                            Fluttertoast.showToast(
                                msg: "Email or Password is missed",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.cyan,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        },
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'please Insert your Password';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20,),
                      ConditionalBuilder(
                        condition: state is! LoadingUserLogin,
                        builder: (BuildContext context) => defultMaterialButton(
                          width: double.infinity,
                          background: Colors.grey.withOpacity(.4),
                          function: () {
                            if (formKey.currentState.validate()) {
                              UserLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            } else {
                              defaultFlutterToast(
                                  msg: 'Email or Password is missed',
                                  background: Colors.cyan);
                            }
                          },
                          text: 'Login ',
                        ),
                        fallback: (BuildContext context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       "Don't have account?",
                      //       style: Theme.of(context).textTheme.bodyText2,
                      //     ),
                      //     TextButton(
                      //       onPressed: () {
                      //         NavigateTo(context, RegisterScreen());
                      //       },
                      //       child: const Text(
                      //         'Register here',
                      //         style: TextStyle(color: Colors.blue),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
