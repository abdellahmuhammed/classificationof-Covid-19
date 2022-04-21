import 'package:finalproject/shared/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CTScanScreen extends StatelessWidget {
  const CTScanScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          body: ListView.separated(
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
            itemCount: 15,
          ),
        ),
    );
  }
// Image(
//               image: const NetworkImage('https://student.valuxapps.com/storage/uploads/banners/1648845777FC4nO.IMG-20220324-WA0010.jpg'),
//                 height: MediaQuery.of(context).size.height*.4,
//                 width: MediaQuery.of(context).size.width*1,
//                 fit: BoxFit.cover,
//
//               ),
//               Image(
//                 image: const NetworkImage('https://student.valuxapps.com/storage/uploads/banners/1648845777FC4nO.IMG-20220324-WA0010.jpg'),
//                 height: MediaQuery.of(context).size.height*.4,
//                 width: MediaQuery.of(context).size.width*1,
//                 fit: BoxFit.cover,
//
//
//               ),
}
