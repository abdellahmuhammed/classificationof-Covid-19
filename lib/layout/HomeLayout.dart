import 'package:finalproject/layout/cubit/Covid_19App/covid_19_app_cubit.dart';
import 'package:finalproject/layout/cubit/DarkMode/dark_mode_cubit.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Covid19AppCubit, Covid19AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = Covid19AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  DarkModeCubit.get(context).changeAppMode();
                },
                icon: const Icon(Icons.dark_mode),
              ),
            ],
          ),
          drawer: SafeArea(child: defultDrawer(context: context)),
          bottomNavigationBar: BottomNavigationBar(
            items: Covid19AppCubit.get(context).bottom,
            currentIndex: Covid19AppCubit.get(context).currentIndex,
            onTap: (index) {
              Covid19AppCubit.get(context).ChangeBottomNavBar(index);
            },
          ),
          body: Covid19AppCubit.get(context)
              .screens[Covid19AppCubit.get(context).currentIndex],
        );
      },
    );
  }
}
