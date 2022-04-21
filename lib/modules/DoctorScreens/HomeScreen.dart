// ignore_for_file: file_names

import 'package:finalproject/modules/DoctorScreens/patient%20details.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
          itemBuilder: (context , index) => buildHomeScreen(context: context),
          separatorBuilder:  (context , index) => MyDivider(),
          itemCount: 15
      ),
    );
  }

  Widget buildHomeScreen({context})=>InkWell(
    onTap: (){
      NavigateTo(context,  PatientDetails());
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*.16,
            width: MediaQuery.of(context).size.width*.4,
            decoration: BoxDecoration(
                image:   DecorationImage(
                  image: NetworkImage('https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15.0)),
          ),
          const SizedBox(width: 20,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name,here',
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                  maxLines: 3,
                ),
                const SizedBox(height: 10,),
                Text(
                  'infection_date',
                  style: Theme.of(context).textTheme.bodyText2,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
