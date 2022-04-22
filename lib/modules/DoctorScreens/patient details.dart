// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:finalproject/layout/cubit/DoctorCubit/doctor_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/CTScanScreen/CTScanScreen.dart';
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
    return BlocProvider(
      create: (context) => DoctorCubit(),
      child: BlocConsumer<DoctorCubit, DoctorState>(
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
                          TextButton(
                            onPressed: () {
                              NavigateTo(context, const CTScanScreen());
                            },
                            child: const Text(
                              'ShowMore',
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 15),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: DropdownButton2(
                          hint: Text(
                            'Select diagnosis',
                            style: Theme.of(context).textTheme.bodyText2
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
                                  ),
                          )
                              .toList(),
                          value: DoctorCubit.get(context).selectedValue,
                          onChanged: (index) {
                            DoctorCubit.get(context).changeRadioIndex(index);
                          },
                          buttonHeight: 40,
                          buttonWidth: 140,
                          itemHeight: 40,
                        ),
                      ),
                      const SizedBox(height: 15,),
                      defultMaterialButton(
                          function: (){}, // الدوسه بتاعت الزرار
                          text: 'Send diagnose',
                        background: Colors.grey[300]
                      ),
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

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const HomePage(),
//         debugShowCheckedModeBanner: false);
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _stackIndex = 0;
//
//   String _singleValue = "Text alignment right";
//   String _verticalGroupValue = "Pending";
//
//   List<String> _status = ["Pending", "Released", "Blocked"];
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       title: const Text("Radio button group example"),
//     ),
//     body: IndexedStack(
//       index: _stackIndex,
//       children: <Widget>[
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             RadioButton(
//               description: "Text alignment right",
//               value: "Text alignment right",
//               groupValue: _singleValue,
//               onChanged: (value) => setState(
//                     () => _singleValue = value,
//               ),
//               activeColor: Colors.red,
//               textStyle: const TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.red
//               ),
//             ),
//             RadioButton(
//               description: "Text alignment left",
//               value: "Text alignment left",
//               groupValue: _singleValue,
//               onChanged: (value) => setState(
//                     () => _singleValue = value,
//               ),
//               textPosition: RadioButtonTextPosition.left,
//             ),
//           ],
//         ),
//         Column(
//           children: <Widget>[
//             RadioGroup<String>.builder(
//               groupValue: _verticalGroupValue,
//               onChanged: (value) => setState(() {
//                 _verticalGroupValue = value;
//               }),
//               items: _status,
//               itemBuilder: (item) => RadioButtonBuilder(
//                 item,
//               ),
//               activeColor: Colors.red,
//             ),
//             RadioGroup<String>.builder(
//               groupValue: _verticalGroupValue,
//               onChanged: (value) => setState(() {
//                 _verticalGroupValue = value;
//               }),
//               items: _status,
//               itemBuilder: (item) => RadioButtonBuilder(
//                 item,
//                 textPosition: RadioButtonTextPosition.left,
//               ),
//             ),
//           ],
//         ),
//         RadioGroup<String>.builder(
//           direction: Axis.horizontal,
//           groupValue: _verticalGroupValue,
//           horizontalAlignment: MainAxisAlignment.spaceAround,
//           onChanged: (value) => setState(() {
//             _verticalGroupValue = value;
//           }),
//           items: _status,
//           textStyle: const TextStyle(
//               fontSize: 15,
//               color: Colors.blue
//           ),
//           itemBuilder: (item) => RadioButtonBuilder(
//             item,
//
//           ),
//         ),
//       ],
//     ),
//     bottomNavigationBar: BottomNavigationBar(
//       items: const[
//          BottomNavigationBarItem(
//           label:' Text("Single")',
//           icon: Icon(
//             Icons.radio_button_checked,
//           ),
//         ),
//          BottomNavigationBarItem(
//           label: ' Text("Vertical")',
//           icon: Icon(
//             Icons.list,
//           ),
//         ),
//          BottomNavigationBarItem(
//           label: 'Text("Horizontal")',
//           icon: Icon(
//             Icons.linear_scale,
//           ),
//         ),
//       ],
//       currentIndex: _stackIndex,
//       onTap: (index) => setState(
//             () => _stackIndex = index,
//       ),
//     ),
//   );
// }
