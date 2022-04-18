// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables





import 'package:dio/dio.dart';
import 'package:finalproject/models/GetDataUser/GetUserDataModel.dart';
import 'package:finalproject/models/userLogin/UserLoginModel.dart';
import 'package:finalproject/modules/InfoScreen/HomeScreen.dart';
import 'package:finalproject/modules/statistics%20Screen/statistics%20Screen.dart';

import 'package:finalproject/shared/Constant.dart';

import 'package:finalproject/shared/remote/DioApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/Constant.dart';



part 'covid_19_app_state.dart';

class Covid19AppCubit extends Cubit<Covid19AppStates> {
  Covid19AppCubit() : super(Covid19AppInitial());

  static Covid19AppCubit get(context) => BlocProvider.of(context);

  UserLoginData userLoginModel;

  List<Widget> screens = [
    const HomeScreen(),
    StatisticsScreen(),
  ];

  List<String> titles = [
    'Home ',
    'Statistics',
  ];

  List<BottomNavigationBarItem> bottom = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.auto_stories), label: 'home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.baby_changing_station_sharp), label: 'Statistics'),
  ];

  var currentIndex = 0;

  void ChangeBottomNavBar(index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }


// to get data

  GetUserDataModel get1;





  void getUserProfile( ) {
    emit(LoadingGetDataUserState());
    DioApi.PostData(
      url: 'api/users',
      data: FormData.fromMap({
        'action': 'fetch',
        'api_section': 'users',
        'user_id':userid,



      }),
      token: token,
    ).then((value) {
     get1=GetUserDataModel.fromJson(value.data);

     // var user_id=GetUserDataModel().data ;


      printFullText(' data successfully ');
      //printFullText(' success is ${value.data}');


      printFullText(' success is ${get1.success}');
      printFullText(' success is ${get1.data[0].iD}');
      printFullText(' success is ${get1.data[0].username}');

    }).catchError((onError) {
      emit(GetDataUserStateError());
      printFullText('Happened Error when get data ${onError.toString()}');
    });
  }

  void UpdateUserProfile(email, password, username, dob, gender, address, phone_num,
      ssn, role_id)
  {
    emit(LoadingUpdateDataUserState());
      DioApi.PostData(
        url: 'api/users',
        data: FormData.fromMap({
          'api_section': 'users',
          'action': 'edit',
          'email': email,
          'password': password,
          'username': username,
          'gender': gender,
          'dob': dob,
          'address': address,
          'phone_num': phone_num,
          'ssn': ssn,
          'role_id': role_id,
        })).then((value) {
      printFullText(value.data.toString());
      get1 = GetUserDataModel.fromJson(value.data);
      printFullText('update successfully');
      emit(UpdateDataUserStateSuccess());
    }).catchError((onError) {
      printFullText('Error Happened when update user data ${onError.toString()}');
      emit(UpdateDataUserStateError(onError.toString()));
    });
  }


}
