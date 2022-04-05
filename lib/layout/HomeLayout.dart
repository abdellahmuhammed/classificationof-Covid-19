import 'package:finalproject/layout/cubit/Covid_19App/covid_19_app_cubit.dart';
import 'package:finalproject/layout/cubit/DarkMode/dark_mode_cubit.dart';
import 'package:finalproject/modules/profile/profile.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/LoginScreen/Login_Screen.dart';
import '../shared/styles/colors.dart';

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
            title:  Text(cubit.titles[cubit.currentIndex],
            ),
          ),
          drawer: SizedBox(
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
                  TextButton(
                    onPressed: () {
                      NavigateTo(context, ProfileScreen());
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.person),
                         SizedBox(
                          width: 20,
                        ),
                        Text('Profile'),
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
                  TextButton(
                    onPressed: () {
                      NavigateAndRemove(context, Covid19LoginScreen());
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.logout),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Logout'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: Covid19AppCubit.get(context).bootom,
            currentIndex: Covid19AppCubit.get(context).currentIndex,
            onTap: (index) {
              Covid19AppCubit.get(context).ChangeBottomNavBar(index);
            },
          ),
          body: Covid19AppCubit.get(context).screens[Covid19AppCubit.get(context).currentIndex],
        );
      },
    );
  }
}
