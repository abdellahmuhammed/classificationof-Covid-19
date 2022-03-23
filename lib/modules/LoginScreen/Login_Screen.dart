import 'package:finalproject/layout/HomeLayout.dart';
import 'package:finalproject/layout/cubit/Covid_19App/covid_19_app_cubit.dart';
import 'package:finalproject/modules/RegisterScreen/RegisterScreen.dart';
import 'package:finalproject/modules/forgetPassword/ForgetPassword_Screen.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/colors.dart';

class Covid19LoginScreen extends StatelessWidget
{
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var FormKey = GlobalKey<FormState>();

  Covid19LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<Covid19AppCubit, Covid19AppStates>(
      listener: (context, state) {
        if (state is PostDataSuccessState) {
          if (state.loginModel.success == 'Ok') {
            // Dialog(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(25.0),
            //   ),
            //   child: Stack(
            //     overflow: Overflow.visible,
            //     alignment: Alignment.topCenter,
            //     children: [
            //       Center(
            //         child: Container(
            //           height: MediaQuery.of(context).size.height * .4,
            //           width: MediaQuery.of(context).size.width * .4,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(15),
            //             color: grey,
            //           ),
            //           child: Text(
            //             'Your Email or Password is Wrong'.toUpperCase(),
            //             style: Theme.of(context).textTheme.bodyText2,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // );

            // {
            //   // Fluttertoast.showToast(
            //   //     msg: 'your Email or Password is wrong',
            //   //     toastLength: Toast.LENGTH_LONG,
            //   //     gravity: ToastGravity.BOTTOM,
            //   //     backgroundColor: Colors.blue,
            //   //     textColor: Colors.black,
            //   //     fontSize: 16.0);
            // }
          }
        }
      },
      builder: (context, state) {
        var cubit = Covid19AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
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
                      Containerheight: MediaQuery.of(context).size.height * .35,
                      Containerwidth: MediaQuery.of(context).size.width * 1,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      ' تسجيل الدخول' ,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defultTextFormFiled(context,
                        controller: EmailController,
                        type: TextInputType.emailAddress,
                        label: 'إدخل البريد الاكتروني',
                        prefixIcon: Icons.email, validate: (String Value) {
                          if (Value.isEmpty) {
                            return 'من فضلك ادخل البريد الاكتروني';
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
                      controller: PasswordController,
                      type: TextInputType.visiblePassword,
                      label: 'إدخل كلمة السر',
                      prefixIcon: Icons.lock,
                      isPassword: cubit.isPassword,
                      suffixIcon: cubit.isPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      suffixPressed: () {
                        cubit.ChangeShowPassword();
                      },
                      validate: (String Value) {
                        if (Value.isEmpty) {
                          return 'من فضلك ادخل  كلمة السر';
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
                        }, text: 'هل نسيت كلمة السر؟', color: Colors.blue ,

                        ),
                      ],
                    ),
                    defultMaterialButton(
                      width: double.infinity,
                      background: Colors.grey.withOpacity(.4),
                      function: () {
                        if (FormKey.currentState.validate()) {
                          Covid19AppCubit.get(context).postdata(EmailController.text, PasswordController.text, context);
                          NavigateAndRemove(context, const HomeLayoutScreen());
                        }
                      },
                      text: 'تسجيل الدخول',
                    ),

                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: (){
                            NavigateTo(context,  RegisterScreen());
                          },
                          child: const Text('سجل هنا' ,
                            style: TextStyle(
                                color: Colors.blue
                            ),
                          ),
                        ),
                        Text('ليس لديك حساب؟' ,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),

                      ],
                    )
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
