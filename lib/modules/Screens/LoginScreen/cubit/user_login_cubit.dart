// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:finalproject/models/userLogin/UserLoginModel.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:finalproject/shared/remote/DioApi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(UserLoginInitial());
 static UserLoginCubit get(context) => BlocProvider.of(context);

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

  void changeIcon()
  {
    isPassword = !isPassword;
    emit(ChangeIconState());
  }

  UserLoginData userLoginModel;


// new update
  void userLogin({
    @required String email,
    @required String password,
  }){

    emit(LoadingUserLogin());
    DioApi.PostData(
        url: 'api/users',
        data: FormData.fromMap({
          'action': 'login',
          'api_section': 'users',
          'email': email,
          'password': password,
        }),
    ).then((value) {
      userLoginModel = UserLoginData.fromJson(value.data);

      CatchHelper.saveData(key: 'check', value: value.data['user_id']);
      emit(UserLoginSuccess(userLoginModel));
    }).catchError((onError)
    {
      printFullText('Error happened when user Login ${onError.toString()}');
      emit(UserLoginError(onError));
    });
  }

}
