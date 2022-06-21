
import 'package:conditional_builder/conditional_builder.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:finalproject/layout/cubit/DarkMode/dark_mode_cubit.dart';
import 'package:finalproject/layout/cubit/home%20cuibt/covid_home_layou_cubit.dart';
import 'package:finalproject/modules/PatientScreens/PatientProfile/PatientProfile.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_state.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientHomeLayoutScreen extends StatelessWidget{
  const PatientHomeLayoutScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    return BlocConsumer<PatientCubit, PatientStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
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
            condition: PatientCubit.get(context).getPatientDataModel != null,
            builder: (BuildContext context) => defultDrawer(
              context,
              PatientCubit.get(context).getPatientDataModel.data[0].username,
              PatientCubit.get(context).getPatientDataModel.data[0].phoneNum,
              PatientProfileScreen(),
            ),
            fallback: (BuildContext context) =>  Container(),
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
            children: PatientCubit.get(context).PatientBottomNavBarList,
          ),
        );
      },
    );
  }

}
