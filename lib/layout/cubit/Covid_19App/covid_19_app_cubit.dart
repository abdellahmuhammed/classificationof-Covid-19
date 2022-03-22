// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:finalproject/layout/HomeLayout.dart';
import 'package:finalproject/models/loginmodel/loginmodel.dart';
import 'package:finalproject/modules/InfoScreen/HomeScreen.dart';
import 'package:finalproject/modules/news/news.dart';
import 'package:finalproject/modules/statistics%20Screen/statistics%20Screen.dart';
import 'package:finalproject/modules/users/Doctor/Doctor.dart';
import 'package:finalproject/modules/users/Paramedic/paramedic.dart';
import 'package:finalproject/modules/users/Patient/patient.dart';
import 'package:finalproject/shared/component.dart';
import 'package:finalproject/shared/remote/DioApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'covid_19_app_state.dart';

class Covid19AppCubit extends Cubit<Covid19AppStates>
{
  Covid19AppCubit() : super(Covid19AppInitial());

  static Covid19AppCubit get(context) => BlocProvider.of(context);

  LoginModel loginModel;
  Data date2;


  bool isPassword = true;
  bool confirmPassword = true;

  void ChangeShowPassword()
  {
    isPassword = !isPassword;
    emit(ChangeShowPasswordState());
  }

  void ChangeConfirmShowPassword()
  {
    confirmPassword = !confirmPassword;
    emit(ChangeShowPasswordState());
  }

  List<Widget> screens = [
    const HomeScreen(),
    const StatisticsScreen(),
    const NewsScreen(),
  ];

  List<BottomNavigationBarItem> bootom = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.auto_stories), label: 'home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.baby_changing_station_sharp), label: 'Statistics'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.arrow_back_ios_new_sharp), label: 'News'),
  ];

  var currentIndex = 0 ;


  void ChangeBottomNavBar(index)

  {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

var roleId ;

   Future<Response> postdata( String email, String password, context )
  async

  {
    emit(PostDataLoadingState());
 return await DioApi.PostData(
        url: 'api/users',
        data: FormData.fromMap({
          'api_section': 'users',
          'action': 'login',
          'email': email,
          'password': password,
        })).then((value ) {
      print(value.data.toString());
     var  user_role=value.data['user_role']; //to show roleID
if(user_role=='Radiologist')
{
  NavigateAndRemove(context, const HomeLayoutScreen());
}
else if (user_role=='ParamedicScreen')
{
  NavigateAndRemove(context, const ParamedicScreen());

}
else if (user_role=='Doctor')
{
  NavigateAndRemove(context, const DoctorScreen());
}
else if (user_role=='Patient')
{
  NavigateAndRemove(context, const PatientScreen());
}
else {
  return null;
}




      loginModel = LoginModel.fromJson(value.data);
      emit(PostDataSuccessState(loginModel ));
    }).catchError((onError) {
      print('Error Happened when post data ${onError.toString()}');
      emit(PostDataErrorState(onError.toString()));
    });
  }

   Future<Response> postRegisterdata(
      email, password, username, dob, gender, address, phone_num, ssn, role_id)async {
    emit(PostDataLoadingState());
  return await  DioApi.PostData(
        url: 'api/users',
        data: FormData.fromMap({
          'api_section': 'users',
          'action': 'add',
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
      print(value.data.toString());
      loginModel = LoginModel.fromJson(value.data);
      emit(PostDataSuccessState(loginModel ));
    }).catchError((onError) {
      print('Error Happened when post data ${onError.toString()}');
      emit(PostDataErrorState(onError.toString()));
    });
  }

  var value ;

  void RadioButton(){

  }
}

