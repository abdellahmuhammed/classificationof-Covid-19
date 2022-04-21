// ignore_for_file: must_be_immutable

import 'package:finalproject/modules/DoctorScreens/CTScanScreen/CTScanScreen.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';

class PatientDetails extends StatelessWidget {
   PatientDetails({Key key}) : super(key: key);

   var userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment:AlignmentDirectional.bottomEnd ,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*.16,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        // ct scan image
                          image:  DecorationImage(
                              image: NetworkImage('https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    TextButton(
                        onPressed: (){
                          NavigateTo(context, CTScanScreen());
                        },
                        child: Text('ShowMore' , style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15
                        ),
                        ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                 Text('Personal Information' , style: Theme.of(context).textTheme.bodyText1,),
                const SizedBox(
                  height: 30,
                ),
                buildPersonalInformation(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

Widget buildPersonalInformation (context) => Column(
  children: [
    Row(
      children: [
        Text('user name' ,style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(width: MediaQuery.of(context).size.width*.11),
        SizedBox(
          width: MediaQuery.of(context).size.width*.6,
          height: MediaQuery.of(context).size.height*.04,
          child: defultTextFormFiled(
              context,
              controller: userNameController,
              prefixIcon: Icons.person,
              validate: null, type: null, label: ''
          ),
        ),
      ],
    ),
    const SizedBox(height: 15,),
    Row(
      children: [
        Text('email' ,style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(width: MediaQuery.of(context).size.width*.21),
        SizedBox(
          width: MediaQuery.of(context).size.width*.6,
          height: MediaQuery.of(context).size.height*.04,
          child: defultTextFormFiled(
              context,
              controller: userNameController,
              prefixIcon: Icons.person,
              validate: null, type: null, label: ''
          ),
        ),
      ],
    ),
    const SizedBox(height: 15,),
    Row(
      children: [
        Text('phone' ,style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(width: MediaQuery.of(context).size.width*.2),
        SizedBox(
          width: MediaQuery.of(context).size.width*.6,
          height: MediaQuery.of(context).size.height*.04,
          child: defultTextFormFiled(
              context,
              controller: userNameController,
              prefixIcon: Icons.person,
              validate: null, type: null, label: ''
          ),
        ),
      ],
    ),
    const SizedBox(height: 15,),
    Row(
      children: [
        Text('National ID' ,style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(width: MediaQuery.of(context).size.width*.1),
        SizedBox(
          width: MediaQuery.of(context).size.width*.6,
          height: MediaQuery.of(context).size.height*.04,
          child: defultTextFormFiled(
              context,
              controller: userNameController,
              prefixIcon: Icons.person,
              validate: null, type: null, label: ''
          ),
        ),
      ],
    ),
    const SizedBox(height: 15,),
    Row(
      children: [
        Text('job' ,style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(width: MediaQuery.of(context).size.width*.26),
        SizedBox(
          width: MediaQuery.of(context).size.width*.6,
          height: MediaQuery.of(context).size.height*.04,
          child: defultTextFormFiled(
              context,
              controller: userNameController,
              prefixIcon: Icons.person,
              validate: null, type: null, label: ''
          ),
        ),
      ],
    ),
    const SizedBox(height: 15,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text('address' ,style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width*.6,
          height: MediaQuery.of(context).size.height*.04,
          child: defultTextFormFiled(
              context,
              controller: userNameController,
              prefixIcon: Icons.person,
              validate: null, type: null, label: ''
          ),
        ),
      ],
    ),
    const SizedBox(height: 15,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text('dob' ,style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width*.6,
          height: MediaQuery.of(context).size.height*.04,
          child: defultTextFormFiled(
              context,
              controller: userNameController,
              prefixIcon: Icons.person,
              validate: null, type: null, label: ''
          ),
        ),
      ],
    ),
    const SizedBox(height: 15,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('gender' ,style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width*.6,
          height: MediaQuery.of(context).size.height*.04,
          child: defultTextFormFiled(
              context,
              controller: userNameController,
              prefixIcon: Icons.person,
              validate: null, type: null, label: ''
          ),
        ),
      ],
    ),
    const SizedBox(height: 15,),
  ],
);
}
