import 'package:flutter/material.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient'),
      ),
      body: const Center(
          child:  Text('Patient Screen')
      ),
    );
  }
}
