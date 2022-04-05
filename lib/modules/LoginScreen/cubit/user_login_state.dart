part of 'user_login_cubit.dart';

@immutable
abstract class UserLoginState {}

class UserLoginInitial extends UserLoginState {}

class ChangeIconState extends UserLoginState {}
class ChangeShowPasswordState extends UserLoginState {}


class LoadingUserLogin extends UserLoginState {}
class UserLoginSuccess extends UserLoginState {
  final UserLoginModel userLoginModel;
  UserLoginSuccess(this.userLoginModel);
}
class UserLoginError extends UserLoginState {
  final String error;
  UserLoginError(this.error);
}



