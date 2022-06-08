import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';
ThemeData lightTheme = ThemeData(
  primarySwatch: deepOrange,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 20.0,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.black,
    unselectedIconTheme: IconThemeData(
      color: Colors.grey[600],
      size: 30.0,
    ),
    selectedIconTheme: const IconThemeData(
      color: Colors.blue,
      size: 30.0,
    ),
    unselectedLabelStyle: const TextStyle(
        color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.normal),
    selectedLabelStyle: const TextStyle(
        color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
  ),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    centerTitle: true,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
);
ThemeData darkTheme = ThemeData(
  backgroundColor: Colors.black26,
  primarySwatch: deepOrange,
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.black26),
  secondaryHeaderColor: Colors.white,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    elevation: 20.0,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.white,
    unselectedIconTheme: IconThemeData(
      color: Colors.grey[600],
      size: 30.0,
    ),
    selectedIconTheme: const IconThemeData(
      color: Colors.blue,
      size: 30.0,
    ),
    unselectedLabelStyle: const TextStyle(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.normal),
    selectedLabelStyle: const TextStyle(
        color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
  ),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Colors.black,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
);
