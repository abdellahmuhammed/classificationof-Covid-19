// ignore_for_file: file_names, unnecessary_string_interpolations, must_be_immutable, void_checks, missing_return
import 'dart:math' as math;
import 'package:conditional_builder/conditional_builder.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:custom_full_image_screen/custom_full_image_screen.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'package:finalproject/layout/cubit/DarkMode/dark_mode_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/DoctorProfileScreen/DoctorProfileScreen.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_state.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_state.dart';
import 'package:finalproject/modules/Screens/LoginScreen/Login_Screen.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorHomeLayoutScreen extends StatelessWidget {
  DoctorHomeLayoutScreen({Key key}) : super(key: key);
  int controller;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isBottomSheetShown = false;
  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();

    return BlocConsumer<PatientCubit, PatientStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    DarkModeCubit.get(context).changeAppMode();
                  },
                  icon: const Icon(Icons.dark_mode),
                ),
              ],
            ),
            drawer: ConditionalBuilder(
              condition: PatientCubit.get(context).getPatientDataModel != null ,
              builder: (BuildContext context) => defultDrawer(context, DoctorCubit.get(context).getPatientDataModel.data[0].username, DoctorCubit.get(context).getPatientDataModel.data[0].phoneNum, DoctorProfileScreen() ,),
              fallback: (BuildContext context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              items: [
                CustomBottomNavigationBarItem(
                  icon: Icons.auto_stories,
                  title: "overview",
                ),
                CustomBottomNavigationBarItem(
                  icon: Icons.baby_changing_station,
                  title: "Statistics",
                ),
                CustomBottomNavigationBarItem(
                  icon: Icons.ac_unit,
                  title: "states",
                ),
              ],
              onTap: (index) {
                _pageController.animateToPage(index,
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: const Duration(milliseconds: 600));
              },
            ),
            body: PageView(
              controller: _pageController,
              children: DoctorCubit.get(context).DocBottomNavBarList,
            ),
          );
        });
  }
}
