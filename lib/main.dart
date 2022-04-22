import 'package:finalproject/MyBlocObserver.dart';
import 'package:finalproject/layout/HomeLayout.dart';
import 'package:finalproject/layout/cubit/Covid_19App/covid_19_app_cubit.dart';
import 'package:finalproject/layout/cubit/DarkMode/dark_mode_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/HomelayoutScreen.dart';
import 'package:finalproject/modules/LoginScreen/Login_Screen.dart';
import 'package:finalproject/modules/OnBoardingScreen/OnBoardingScreen.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:finalproject/shared/remote/DioApi.dart';
import 'package:finalproject/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioApi.init();
  await CatchHelper.init();
  bool onBoarding = CatchHelper.getData(key: 'OnBoarding');
  bool isDarkShow = CatchHelper.getData(key: 'isDarkShow');
  dynamic userid = CatchHelper.getData(key: 'userid');

  // printFullText('onBoarding is $onBoarding');
  // printFullText('isDarkShow is $isDarkShow');
  printFullText('token is $token');
 print(userid);


  Widget widget;

  if (onBoarding != null) {
    if (userid != null) {
      widget = const DoctorHomeScreen();
    } else {
      widget = Covid19LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        isDarkShow: isDarkShow,
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  final bool isDarkShow;

  const MyApp({Key key, this.startWidget, this.isDarkShow}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Covid19AppCubit()
            //..getUserProfile(),
        ),
        BlocProvider(
          create: (context) =>
              DarkModeCubit()..changeAppMode(formShared: false),
        ),
      ],
      child: BlocConsumer<DarkModeCubit, DarkModeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: DarkModeCubit.get(context).isDarkShow
                ? ThemeMode.dark
                : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
