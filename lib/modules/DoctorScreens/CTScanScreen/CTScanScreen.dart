import 'package:finalproject/modules/DoctorScreens/DiagnosisScreen/DiagnosisScreen.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';

class CTScanScreen extends StatelessWidget {
  const CTScanScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) =>Column(
            children: [
              Image(
                image: const NetworkImage('https://student.valuxapps.com/storage/uploads/banners/1648845777FC4nO.IMG-20220324-WA0010.jpg'),
                height: MediaQuery.of(context).size.height*.3,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
            separatorBuilder: (BuildContext context, int index)=>MyDivider(),
            itemCount: 10,
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
             // NavigateTo(context,  );
            },
            label: const Text('diagnose the Patient'),
            icon: const Icon(Icons.send),
            backgroundColor: Colors.grey.withOpacity(.6),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
    );
  }
}
