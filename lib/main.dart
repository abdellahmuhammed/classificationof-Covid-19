import 'package:finalproject/MyBlocObserver.dart';
import 'package:finalproject/layout/HomeLayout.dart';
import 'package:finalproject/layout/cubit/Covid_19App/covid_19_app_cubit.dart';
import 'package:finalproject/layout/cubit/DarkMode/dark_mode_cubit.dart';
import 'package:finalproject/layout/cubit/DoctorCubit/doctor_cubit.dart';
import 'package:finalproject/models/userLogin/UserLoginModel.dart';
import 'package:finalproject/modules/DoctorScreens/HomelayoutScreen.dart';
import 'package:finalproject/modules/LoginScreen/Login_Screen.dart';
import 'package:finalproject/modules/OnBoardingScreen/OnBoardingScreen.dart';
import 'package:finalproject/modules/users/Paramedic/paramedic.dart';
import 'package:finalproject/modules/users/Patient/patient.dart';
import 'package:finalproject/modules/users/Radiologist/Radiologist.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:finalproject/shared/remote/DioApi.dart';
import 'package:finalproject/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioApi.init();
  await CatchHelper.init();
  bool onBoarding = CatchHelper.getData(key: 'OnBoarding');
  bool isDarkShow = CatchHelper.getData(key: 'isDarkShow');
  dynamic userid = CatchHelper.getData(key: 'userid');
  dynamic rolId = CatchHelper.getData(key: 'RolId');

  // printFullText('onBoarding is $onBoarding');
  // printFullText('isDarkShow is $isDarkShow');
  printFullText('token is $token');
  printFullText('RolId is $rolId');
  printFullText('userid is $userid');

  Widget widget;

  if (onBoarding != null) {
    if (userid != null) {
      if(rolId== 2){
        widget = const DoctorHomeScreen();
      }
      if(rolId== 3){
        widget =  HomeLayoutScreen();
      }
      if(rolId== 4){
        widget =  HomeLayoutScreen();
      }
      if(rolId == 5){
        widget = const RadiologistScreen();
      }
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
            create: (context) => DoctorCubit()..getLessPro()
          //..getUserProfile(),
        ),
        BlocProvider(
          create: (context) => Covid19AppCubit()..getUserProfile()
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
            home: OfflineBuilder(
              connectivityBuilder: (
                  BuildContext context,
                  ConnectivityResult connectivity,
                  Widget child,
                  ) {
                final bool connected = connectivity != ConnectivityResult.none;
                if (connected) {
                  return startWidget;
                } else {
                  return noInternetBuilder(context);
                }
              },
              child: Column(),
            ),
          );
        },
      ),
    );
  }

  Widget noInternetBuilder(context) => Center(
    child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/817-no-internet-connection.gif' ,
                height: MediaQuery.of(context).size.height*.5,
                width: MediaQuery.of(context).size.width*.8
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'No Internet Connection..check Internet',
              style: TextStyle(color: Colors.black, fontSize: 14.5 ,decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    ),
  );
}
