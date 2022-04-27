// ignore_for_file: file_names, unnecessary_string_interpolations

import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/layout/cubit/DarkMode/dark_mode_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/DoctorProfileScreen/DoctorProfileScreen.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_state.dart';
import 'package:finalproject/modules/DoctorScreens/patient%20details/patient%20details.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/modules/Screens/LoginScreen/Login_Screen.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:finalproject/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorHomeLayoutScreen extends StatelessWidget {
  const DoctorHomeLayoutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          var cubit= DoctorCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            drawer: ConditionalBuilder(
              condition: state is ! DoctorLoadingState,
              builder: (BuildContext context)=> defultDrawer(
                context,
                cubit.getInfectedUser.data[0].doctor,
                cubit.getInfectedUser.data[0].doctorId,
                DoctorProfileScreen(),
              ),
              fallback: (BuildContext context)=> const Center(
                child:CircularProgressIndicator(),),
            ),
            body: ConditionalBuilder(
              condition: state is ! DoctorLoadingState,
              builder: (BuildContext context)=>ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildHomeScreen(context: context, index: index ,),
                  separatorBuilder: (context, index) => MyDivider(),
                  itemCount:cubit.getInfectedUser.data.length,
              ),
              fallback: (BuildContext context)=> const Center(child: CircularProgressIndicator(),),

            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                DoctorCubit.get(context).getPatientData();
              },
              child: Icon(Icons.add)
            ),
          );
        });
  }

  Widget buildHomeScreen({context, index }) => InkWell(
        onTap: () {
          NavigateTo(context, PatientDetails());
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .16,
                width: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15.0)),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${DoctorCubit.get(context).getInfectedUser.data[index].patient}',
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${DoctorCubit.get(context).getInfectedUser.data[index].infectionDate}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildDrawer({context}) => SizedBox(
        width: 220,
        child: Drawer(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .28,
                width: double.infinity,
                color: countainerColor,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 40, start: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40.0,
                            child:
                                Image(image: AssetImage('assets/images/R.png')),
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
                  onPressed: () {
                    NavigateTo(context, DoctorProfileScreen());
                  },
                  icon: Icons.person,
                  text: 'Profile'),
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
                  onPressed: () {
                    CatchHelper.removeUserData(key: 'userid').then((value) {
                      if (value) {
                        NavigateAndRemove(context, LoginScreen());
                      }
                    });
                  },
                  icon: Icons.logout,
                  text: 'Logout'),
            ],
          ),
        ),
      );
}
