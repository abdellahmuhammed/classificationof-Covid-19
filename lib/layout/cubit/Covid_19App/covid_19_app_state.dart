// ignore_for_file: non_constant_identifier_names

part of 'covid_19_app_cubit.dart';

@immutable
abstract class Covid19AppStates {}

class Covid19AppInitial extends Covid19AppStates {}
class ChangeShowPasswordState extends Covid19AppStates {}
class ChangeBottomNavBarState extends Covid19AppStates {}

// get profile

class LoadingGetDataUserState extends Covid19AppStates{}
class GetDataUserStateSuccess extends Covid19AppStates{}
class GetDataUserStateError extends Covid19AppStates{}


// update profile


class LoadingUpdateDataUserState extends Covid19AppStates{}
class UpdateDataUserStateSuccess extends Covid19AppStates{}
class UpdateDataUserStateError extends Covid19AppStates{
  final String onError;

  UpdateDataUserStateError(this.onError);
}


