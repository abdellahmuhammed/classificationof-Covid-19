import 'package:flutter/material.dart';

class RadiologistScreen extends StatelessWidget {
  const RadiologistScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radiologist'),
      ),
      body: const Center(
          child:  Text('Radiologist Screen')
      ),
    );
  }
}
