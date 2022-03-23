import 'package:finalproject/layout/HomeLayout.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: IconButton(onPressed: (){
          NavigateTo(context, const HomeLayoutScreen());
        }, icon: const Icon(Icons.add)),
      ),
    );
  }
}
