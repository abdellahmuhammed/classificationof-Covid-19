// ignore_for_file: file_names

import 'package:finalproject/layout/cubit/DarkMode/dark_mode_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/DoctorProfileScreen/DoctorProfileScreen.dart';
import 'package:finalproject/modules/DoctorScreens/patient%20details/patient%20details.dart';
import 'package:finalproject/modules/LoginScreen/Login_Screen.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:finalproject/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        drawer: buildDrawer(context:context ),
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
  Widget buildDrawer({context})=>SizedBox(
    width: 220,
    child: Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .28,
            width: double.infinity,
            color: countainerColor,
            child: Padding(
              padding:
              const EdgeInsetsDirectional.only(top: 40, start: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 40.0,
                        child: Image(
                            image: AssetImage('assets/images/R.png')),
                      ),
                      IconButton(
                          onPressed: () {
                            DarkModeCubit.get(context).changeAppMode();
                          },
                          icon: const Icon(Icons.dark_mode)),
                    ],
                  ),
                  const Spacer(),
                  const Text('Classification of Covid_19'),
                  const Text('01111111111111'),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          defaultTextButtonDrawer(
              onPressed: (){
                NavigateTo(context,  DoctorProfileScreen());
              },
              icon: Icons.person,
              text: 'Profile'
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.language),
                SizedBox(
                  width: 20,
                ),
                Text('Language'),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.phone),
                SizedBox(
                  width: 20,
                ),
                Text('Connect With us'),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          defaultTextButtonDrawer(
              onPressed: (){
                CatchHelper.removeUserData(key: 'userid').then((value) {
                  if (value) {
                    NavigateAndRemove(context, Covid19LoginScreen());
                  }
                });
              },
              icon: Icons.logout,
              text: 'Logout'
          ),
        ],
      ),
    ),
  );

}