// // ignore_for_file: non_constant_identifier_names, file_names, must_be_immutable
// import 'package:conditional_builder/conditional_builder.dart';
// import 'package:finalproject/modules/LoginScreen/Login_Screen.dart';
// import 'package:finalproject/modules/RegisterScreen/cubit/user_register_cubit.dart';
// import 'package:finalproject/shared/Constant.dart';
// import 'package:finalproject/shared/component.dart';
// import 'package:finalproject/shared/styles/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
//
//
// class RegisterScreen extends StatelessWidget {
//
//   var usernameController = TextEditingController();
//   var emailController = TextEditingController();
//   var phoneController = TextEditingController();
//   var addressController = TextEditingController();
//   var dobController = TextEditingController();
//   var passwordController = TextEditingController();
//   var ConfirmepasswordController = TextEditingController();
//   var ssnController = TextEditingController();
//   var vaccination_typeController = TextEditingController();
//   var genderController = TextEditingController();
//   var role_idController = TextEditingController();
//   var jobController = TextEditingController();
//   var FormKey = GlobalKey<FormState>();
//
//   RegisterScreen({Key key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => UserRegisterCubit(),
//       child: BlocConsumer<UserRegisterCubit, UserRegisterState>(
//         listener: (context, state) {
//           if (state is UserRegisterSuccess){
//             if (state.userRegisterModel.success){
//                 printFullText('data of user register saving successfully');
//                 NavigateAndRemove(context, Covid19LoginScreen());
//                 defaultFlutterToast(
//                     msg: 'Register Successfully',
//                     background: Colors.greenAccent
//                 );
//             }
//           }
//         },
//         builder: (context, state) {
//           var cubit = UserRegisterCubit.get(context);
//           return Scaffold(
//             appBar: AppBar(),
//             body: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Form(
//                   key: FormKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Create your account ',
//                           style: Theme.of(context).textTheme.bodyText1),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       // userName
//                       defultTextFormFiled(
//                         context,
//                         controller: usernameController,
//                         type: TextInputType.name,
//                         label: 'Enter User Name',
//                         prefixIcon: Icons.person,
//                         validate: (String value) {
//                           if (value.isEmpty) {
//                             return ' UserName most not be empty';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       // email
//                       defultTextFormFiled(
//                         context,
//                         controller: emailController,
//                         type: TextInputType.emailAddress,
//                         label: 'Enter your email',
//                         prefixIcon: Icons.email,
//                         validate: (String value) {
//                           if (value.isEmpty) {
//                             return ' Email must not be Empty';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       // phone
//                       defultTextFormFiled(
//                         context,
//                         controller: phoneController,
//                         type: TextInputType.phone,
//                         label: 'Enter your phone',
//                         prefixIcon: Icons.phone,
//                         maxLength: 11,
//                         validate: (String value) {
//                           if (value.isEmpty) {
//                             return ' phone must not be Empty';
//                           } else if (value.length < 11) {
//                             {
//                               return ' phone is shortest';
//                             }
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       defultTextFormFiled(
//                         context,
//                         controller: addressController,
//                         type: TextInputType.url,
//                         label: 'Enter your Address',
//                         prefixIcon: Icons.place,
//                         onTap: () {
//                         //  NavigateTo(context, const GoogleMapsScreen());
//                         },
//                         validate: (String value) {
//                           if (value.isEmpty) {
//                             return ' phone must not be Empty';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       defultTextFormFiled(
//                         context,
//                         controller: dobController,
//                         type: TextInputType.datetime,
//                         label: 'Enter your Date Of Birth',
//                         prefixIcon: Icons.date_range_outlined,
//                         onTap: () {
//                           showDatePicker(
//                             context: context,
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime.parse('1940-12-12'),
//                             lastDate: DateTime.now(),
//                           ).then((value) {
//                             dobController.text =
//                                 DateFormat.yMMMd().format(value).toString();
//                           });
//                         },
//                         validate: (String value) {
//                           if (value.isEmpty) {
//                             return ' Date Of Birth must not be Empty';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       defultTextFormFiled(
//                         context,
//                         controller: ssnController,
//                         type: TextInputType.number,
//                         label: 'Enter your National ID',
//                         prefixIcon: Icons.airline_seat_individual_suite_sharp,
//                         maxLength: 14,
//                         validate: (String value) {
//                           if (value.isEmpty) {
//                             return ' National ID must not be Empty';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       defultTextFormFiled(
//                         context,
//                         controller: genderController,
//                         type: TextInputType.text,
//                         label: 'Enter your gender',
//                         prefixIcon: Icons.six__ft_apart_sharp,
//                         validate: (String value) {
//                           if (value.isEmpty) {
//                             return ' gender must not be Empty';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//
//                       defultTextFormFiled(
//                         context,
//                         controller: role_idController,
//                         type: TextInputType.name,
//                         label: 'Rol_Id',
//                         prefixIcon: Icons.airline_seat_individual_suite_sharp,
//                         validate: (String value) {
//                           if (value.isEmpty) {
//                             return ' Rol_ID most not be empty';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       defultTextFormFiled(
//                         context,
//                         controller: jobController,
//                         type: TextInputType.text,
//                         label: 'job',
//                         prefixIcon: Icons.work,
//                         validate: (String value) {
//                           if (value.isEmpty) {
//                             return ' job most not be empty';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       defultTextFormFiled(
//                         context,
//                         controller: passwordController,
//                         type: TextInputType.visiblePassword,
//                         label: 'Enter your Password',
//                         prefixIcon: Icons.lock,
//                         suffixIcon: cubit.isPassword
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                         isPassword: cubit.isPassword,
//                         onTap: () {
//                           cubit.changeShowPassword();
//                         },
//                         onSubmit: (String value){
//                           {
//                             if (FormKey.currentState.validate()) {
//                               cubit.userRegister(
//                                 email: emailController.text,
//                                 username: usernameController.text,
//                                 password: passwordController.text,
//                                 phone_num: phoneController.text,
//                                 gender: genderController.text,
//                                 ssn: ssnController.text,
//                                 role_id: role_idController.text,
//                                 dob: dobController.text,
//                                 job: jobController.text,
//                                 address: addressController.text,
//                               );
//                             }
//                             else{
//                               defaultFlutterToast(
//                                 msg: 'Email or Password is missed',
//                                 background: Colors.cyan,
//                               );
//                             }
//                           }
//                         },
//                         validate: (String value) {
//                           if (value.isEmpty) {
//                             return ' Password must not be Empty';
//                           } else if (value.length < 5) {
//                             return ' Password isShortest';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Center(
//                         child: ConditionalBuilder(
//                           condition: state is ! LoadingUserRegister,
//                           builder: (BuildContext context)=> defultMaterialButton(
//                             function: () {
//                               if (FormKey.currentState.validate()) {
//                                 cubit.userRegister(
//                                   email: emailController.text,
//                                   username: usernameController.text,
//                                   password: passwordController.text,
//                                   phone_num: phoneController.text,
//                                   gender: genderController.text,
//                                   ssn: ssnController.text,
//                                   role_id: role_idController.text,
//                                   dob: dobController.text,
//                                   job: jobController.text,
//                                   address: addressController.text,
//                                 );
//                               }
//                               else{
//                                 defaultFlutterToast(
//                                   msg: 'Some features is missed',
//                                   background: Colors.cyan,
//                                 );
//                               }
//                             },
//                             background: grey.withOpacity(.25),
//                             text: 'Register',
//                           ),
//                           fallback: (BuildContext context)=>const Center(child: CircularProgressIndicator(),),
//                         ),
//                         //new
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }