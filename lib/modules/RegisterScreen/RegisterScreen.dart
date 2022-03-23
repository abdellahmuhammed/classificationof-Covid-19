
import 'package:finalproject/layout/cubit/Covid_19App/covid_19_app_cubit.dart';
import 'package:finalproject/modules/LoginScreen/Login_Screen.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phone_num = TextEditingController();
  var addressController = TextEditingController();
  var dobController = TextEditingController();
  var passwordController = TextEditingController();
  var ConfirmepasswordController = TextEditingController();
  var ssnController = TextEditingController();
  // var vaccination_typeController = TextEditingController();
  var genderController = TextEditingController();
  var role_id = TextEditingController();

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
                      label: 'Enter User Name',
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
                      context,
                      controller: emailController,
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
                      context,
                      controller: phone_num,
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
                    defultTextFormFiled(
                      context,
                      controller: addressController,
                      type: TextInputType.url,
                      label: 'Enter your Address',
                      prefixIcon: Icons.place,
                      onTap: () {
                        // NavigateTo(context, const GoogleMapsScreen());
                      },
                      validate: (String value) {
                        if (value.isEmpty) {
                          return ' phone must not be Empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defultTextFormFiled(
                      context,
                      controller: dobController,
                      type: TextInputType.datetime,
                      label: 'Enter your Date Of Birth',
                      prefixIcon: Icons.date_range_outlined,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.parse('1940-12-12'),
                          lastDate: DateTime.now(),
                        ).then((value) {
                          dobController.text =
                              DateFormat.yMd()  .format(value).toString();
                        });
                      },
                      validate: (String value) {
                        if (value.isEmpty) {
                          return ' Date Of Birth must not be Empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defultTextFormFiled(
                      context,
                      controller: ssnController,
                      type: TextInputType.number,
                      label: 'Enter your National ID',
                      prefixIcon: Icons.airline_seat_individual_suite_sharp,
                      maxLength: 14,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return ' National ID must not be Empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defultTextFormFiled(
                      context,
                      controller: genderController,
                      type: TextInputType.text,
                      label: 'Enter your gender',
                      prefixIcon: Icons.six__ft_apart_sharp,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return ' gender must not be Empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),

                    defultTextFormFiled(
                      context,
                      controller: role_id,
                      type: TextInputType.name,
                      label: 'Rol_Id',
                      prefixIcon: Icons.airline_seat_individual_suite_sharp,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return ' Rol_ID most not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    defultTextFormFiled(
                      context,
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      label: 'Enter your Password',
                      prefixIcon: Icons.lock,
                      suffixIcon: cubit.isPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      isPassword: cubit.isPassword,
                      onTap: () {
                        cubit.ChangeShowPassword();
                      },
                      validate: (String value) {
                        if (value.isEmpty) {
                          return ' Password must not be Empty';
                        } else if (value.length < 5) {
                          return ' Password isShortest';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defultTextFormFiled(
                      context,
                      controller: ConfirmepasswordController,
                      type: TextInputType.visiblePassword,
                      label: 'Enter your Password',
                      suffixIcon: cubit.confirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      prefixIcon: Icons.lock,
                      isPassword: cubit.confirmPassword,
                      onTap: () {
                        cubit.ChangeConfirmShowPassword();
                      },
                      validate: (String value) {
                        if (value.isEmpty) {
                          return ' Confirmepassword must not be Empty';
                        } else if (passwordController.text !=
                            ConfirmepasswordController.text) {
                          return ' your password do not identical';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // RadioButton(),
                    //  const SizedBox(
                    //    height: 50,
                    //  ),
                    //  Text('select your vaccines'),
                    //   const SizedBox(
                    //     height: 20,
                    //   ),
                    Center(
                      child: defultMaterialButton(
                          function: () {
                            if (FormKey.currentState.validate()) {
                              cubit.postRegisterdata(
                                  emailController.text,
                                  passwordController.text,
                                  usernameController.text,
                                  dobController.text,
                                  addressController.text,
                                  phone_num.text,
                                  ssnController.text,
                                  role_id.text,
                                  genderController.text,

                              ).then((value) {
                                    print('Successfully $value');
                                Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
          ),
          child: Stack(
            overflow: Overflow.visible,
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 280,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                  child: Column(
                    children: [
                      const Text(
                        'Successful',
                        style:  TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Password Changed\nGo To Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      MyDivider(),
                      const SizedBox(
                        height: 45,
                      ),
                      defultTextButton(
                        context,
                          text: 'Ok',
                          function: () {
                            NavigateTo(
                              context,
                               Covid19LoginScreen(),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: -50,
                  child: Image.asset(
                    "assets/images/4.png",
                    width: 100.0,
                  )),
            ],
          ));
                              });
                            }
                          },
                          background: grey.withOpacity(.25),
                          text: 'Register'),
                      //new
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
// Widget RadioButton() {
//   return Column(
//     children: [
//       Row(
//         children: [
//           Radio(
//             value: 1,
//             groupValue: _value,
//             onChanged: (Value) {
//               setState(() {
//                 _value = Value;
//               });
//             },
//           ),
//           const Text('Sinopharm'),
//           const SizedBox(
//             height: 15.0,
//           ),
//         ],
//       ),
//       Row(
//         children: [
//           Radio(
//             value: 2,
//             groupValue: _value,
//             onChanged: (Value) {
//               setState(() {
//                 _value = Value;
//               });
//             },
//           ),
//           const Text('Sinovac'),
//           const SizedBox(
//             height: 15.0,
//           ),
//         ],
//       ),
//       Row(
//         children: [
//           Radio(
//             value: 3,
//             groupValue: _value,
//             onChanged: (Value) {
//               setState(() {
//                 _value = Value;
//               });
//             },
//           ),
//           const Text("Pfizer-BioNTech"),
//           const SizedBox(
//             height: 15.0,
//           ),
//         ],
//       ),
//       Row(
//         children: [
//           Radio(
//             value: 4,
//             groupValue: _value,
//             onChanged: (Value) {
//               setState(() {
//                 _value = Value;
//               });
//             },
//           ),
//           const Text("Moderna"),
//           const SizedBox(
//             height: 15.0,
//           ),
//         ],
//       ),
//       Row(
//         children: [
//           Radio(
//             value: 5,
//             groupValue: _value,
//             onChanged: (Value) {
//               setState(() {
//                 _value = Value;
//               });
//             },
//           ),
//           const Text("Johnson & Johnson"),
//           const SizedBox(
//             height: 15.0,
//           ),
//         ],
//       ),
//       Row(
//         children: [
//           Radio(
//             value: 6,
//             groupValue: _value,
//             onChanged: (Value) {
//               setState(() {
//                 _value = Value;
//               });
//             },
//           ),
//           const Text('Oxford-AstraZeneca'),
//           const SizedBox(
//             height: 15.0,
//           ),
//         ],
//       ),
//       Row(
//         children: [
//           Radio(
//             value: 7,
//             groupValue: _value,
//             onChanged: (Value) {
//               setState(() {
//                 _value = Value;
//               });
//             },
//           ),
//           const Text('Sputnik V'),
//           const SizedBox(
//             height: 15.0,
//           ),
//         ],
//       ),
//     ],
//   );
// }
//





// String selectedValue;
// List<String> items = [
//   'Sinopharm',
//   'Sputnik V',
//   'Oxford-AstraZeneca',
//   'Johnson & Johnson',
//   'Moderna',
//   'Pfizer-BioNTech',
//   'Sinovac',
// ];

// void dropdawon(String value){
//   if (value is String){
//     setState(() {
//
//       _dvalue = value;
//     });
//   }
//
// }
//
// Widget DropDown(context) {
//   DropdownButtonHideUnderline(
//     child: DropdownButton2(
//       hint: Text(
//         'select your vaccines ',
//         style:Theme.of(context).textTheme.bodyText2,
//       ),
//       items: items.map((item) =>DropdownMenuItem<String>(
//             value: item,
//             child: Text(
//               item,
//               style: const TextStyle(
//                 fontSize: 14,
//               ),
//             ),
//           ))
//           .toList(),
//       value: selectedValue,
//       onChanged: (value) {
//         setState(() {
//           selectedValue = value as String;
//         });
//       },
//       buttonHeight: 40,
//       buttonWidth: 140,
//       itemHeight: 40,
//     ),
//   );
// }
//
// Widget DropDonBotton(){
//   DropdownButton(
//     items: const[
//       DropdownMenuItem(child: Text('Sinopharm') , value: 'Sinopharm',),
//       DropdownMenuItem(child: Text('Sputnik') , value: 'Sputnik',),
//       DropdownMenuItem(child: Text('Oxford-AstraZeneca') , value: 'Oxford-AstraZeneca',),
//       DropdownMenuItem(child: Text('Johnson & Johnson') , value: 'Johnson & Johnson',),
//       DropdownMenuItem(child: Text('Moderna') , value: 'Moderna',),
//       DropdownMenuItem(child: Text('Sinovac') , value: 'Sinovac',),
//     ],
//   onChanged: dropdawon,
//   );
// }

// متنساش تعمل componet
//Dialog(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(25.0),
//           ),
//           child: Stack(
//             overflow: Overflow.visible,
//             alignment: Alignment.topCenter,
//             children: [
//               Container(
//                 height: 280,
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
//                   child: Column(
//                     children: [
//                       const Text(
//                         'Successful',
//                         style:  TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 30),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       const Text(
//                         'Password Changed\nGo To Login',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 25,
//                       ),
//                       MyDivider(),
//                       const SizedBox(
//                         height: 45,
//                       ),
//                       defultTextButton(
//                         context,
//                           text: 'Ok',
//                           function: () {
//                             NavigateTo(
//                               context,
//                                Covid19LoginScreen(),
//                             );
//                           },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                   top: -50,
//                   child: Image.asset(
//                     "assets/images/4.png",
//                     width: 100.0,
//                   )),
//             ],
//           ))

