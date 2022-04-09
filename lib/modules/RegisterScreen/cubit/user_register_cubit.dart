// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:finalproject/models/UserRegisterModel/UserRegisterModel.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/remote/DioApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'user_register_state.dart';

class UserRegisterCubit extends Cubit<UserRegisterState> {
  UserRegisterCubit() : super(UserRegisterInitial());

  static UserRegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  bool confirmPassword = true;

  void changeShowPassword() {
    isPassword = !isPassword;
    emit(ChangeShowPasswordState());
  }

  void changeConfirmShowPassword() {
    confirmPassword = !confirmPassword;
    emit(ChangeShowPasswordState());
  }

  void changeIcon() {
    isPassword = !isPassword;
    emit(ChangeIconState());
  }

  UserRegisterDataModel userRegisterModel;

  void userRegister({
    @required String email,
    @required String username,
    @required String password,
    @required dynamic phone_num,
    @required dynamic gender,
    @required dynamic ssn,
    @required dynamic role_id,
    @required String dob,
    @required String job,
    @required String address,
  }) {
    emit(LoadingUserRegister());
    DioApi.PostData(
      url: 'api/users',
      data: FormData.fromMap({
        'api_section': 'users',
        'action': 'add',
        'username': username,
        'email': email,
        'phone_num': phone_num,
        'password': password,
        'gender': gender,
        'ssn': ssn,
        'role_id': role_id,
        'dob': dob,
        'job': job,
        'address': address,
      }),
    ).then((value) {
      userRegisterModel = UserRegisterDataModel.fromJson(value.data);
      printFullText('${userRegisterModel.success}');
      printFullText(userRegisterModel.userId);
      printFullText('user Register Successfully');
      emit(UserRegisterSuccess(userRegisterModel));
    }).catchError((onError) {
      printFullText('Error happened when user Register ${onError.toString()}');
      emit(UserRegisterError(onError));
    });
  }

  String vaccinationTypeSelectedValue;
  List<String> vaccinationTypeItems = [
    'Sinatra',
    'Sinovac',
    'Pfizer-BioNTech',
    'Moderna',
    'Johnson & Johnson',
    'Oxford-AstraZeneca',
    'Sputnik V',
  ];

  void vaccinationTypeDropDownBottom(value) {
    vaccinationTypeSelectedValue = value as String;
     emit(VaccinationTypeDropDownBottomState());
  }

  String ganderTypeSelectedValue;
  List<String> ganderTypeItems = [
    'F',
    'M',

  ];
  void ganderDropDownBottom(value) {
    ganderTypeSelectedValue = value as String;
    emit(GanderDropDownBottomState());
  }

}
