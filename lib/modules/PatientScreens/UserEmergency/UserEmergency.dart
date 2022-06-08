import 'package:finalproject/modules/PatientScreens/PatientHomeLayout.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';

class UserEmergencyScreen extends StatelessWidget {
  UserEmergencyScreen({Key key}) : super(key: key);
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var phone_numController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
              const Text('Add User Emergency'),
              const SizedBox(
                height: 25,
              ),
              defultTextFormFiled(context,
                  controller: nameController,
                  type: TextInputType.text,
                  label: 'Insert his name ',
                  prefixIcon: Icons.person, validate: (String value) {
                if (value.isEmpty) {
                  return 'plz Insert his name ';
                } else {
                  return null;
                }
              }),
              const SizedBox(
                height: 15,
              ),
              defultTextFormFiled(context,
                  controller: addressController,
                  type: TextInputType.text,
                  label: 'Insert his address ',
                  prefixIcon: Icons.place, validate: (String value) {
                if (value.isEmpty) {
                  return 'plz Insert his address ';
                } else {
                  return null;
                }
              }),
              const SizedBox(
                height: 15,
              ),
              defultTextFormFiled(context,
                  controller: phone_numController,
                  type: TextInputType.number,
                  maxLength: 11,
                  label: 'Insert his phone number ',
                  prefixIcon: Icons.phone, validate: (String value) {
                if (value.isEmpty) {
                  return 'plz Insert his phone number ';
                } else {
                  return null;
                }
              }),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: defultMaterialButton(
                    function: ()
                    {
                     if( formKey.currentState.validate()){
                       PatientCubit.get(context).UserEmergencyContact();
                       NavigateTo(context, PatientHomeLayoutScreen());
                     } else {
                       defaultFlutterToast(msg: 'ERROR', background: Colors.red,);

                     }
                    },
                    text: 'Send',
                    background: Colors.grey.withOpacity(.4),
                    width: MediaQuery.of(context).size.width * .4),
              ),
            ],
            ),
          ),
        ),
    );
  }
}
