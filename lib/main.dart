import 'package:finalproject/layout/HomeLayout.dart';
import 'package:finalproject/layout/cubit/Covid_19App/covid_19_app_cubit.dart';
import 'package:finalproject/layout/cubit/DarkMode/dark_mode_cubit.dart';
import 'package:finalproject/modules/LoginScreen/Login_Screen.dart';
import 'package:finalproject/modules/OnBoardingScreen/OnBoardingScreen.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:finalproject/shared/remote/DioApi.dart';
import 'package:finalproject/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioApi.init();
await  CatchHelper.init();
  bool onBoarding = CatchHelper.getData(key: 'OnBoarding');
  bool isDarkShow = CatchHelper.getData(key: 'isDarkShow');

  printFullText('onBoarding is $onBoarding');
  printFullText('isDarkShow is $isDarkShow');
  runApp( MyApp(onBoarding:onBoarding,isDarkShow: isDarkShow,));
}

class MyApp extends StatelessWidget {

  final bool onBoarding;
  final bool isDarkShow;

  const MyApp({Key key, this.onBoarding , this.isDarkShow}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Covid19AppCubit(),
        ),
        BlocProvider(
          create: (context) => DarkModeCubit()..changeAppMode(
            formShared: isDarkShow
          ),
        ),
      ],
      child: BlocConsumer< DarkModeCubit, DarkModeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: DarkModeCubit
                .get(context)
                .isDarkShow ? ThemeMode.dark : ThemeMode.light,
            home:  const HomeLayoutScreen(),
          );
        },
      ),
    );
  }
}
