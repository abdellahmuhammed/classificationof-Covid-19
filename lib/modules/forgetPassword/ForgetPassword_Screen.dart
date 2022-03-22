// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  var ForgetPasswordController = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  ForgetPasswordScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgetPassword' ,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: FormKey,
          child: Column(
            children: [
              defultTextFormFiled(
                context,
                controller: ForgetPasswordController,
                type: TextInputType.emailAddress,
                label: 'Enter your Email',
                prefixIcon: Icons.email,
                radius: 15,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'Please Enter your Email';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              defultMaterialButton(
                background: Colors.grey.withOpacity(.5),
                function: (){
                  if (FormKey.currentState.validate()){
                    print(ForgetPasswordController.text);
                  }
                },
                text: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
