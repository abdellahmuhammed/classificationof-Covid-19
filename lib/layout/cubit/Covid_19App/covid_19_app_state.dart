// ignore_for_file: non_constant_identifier_names

part of 'covid_19_app_cubit.dart';

@immutable
abstract class Covid19AppStates {}

class Covid19AppInitial extends Covid19AppStates {}
class ChangeShowPasswordState extends Covid19AppStates {}
class ChangeBottomNavBarState extends Covid19AppStates {}

// get data from api
class GetDataSuccessState extends Covid19AppStates {}
class GetDataErrorState extends Covid19AppStates {
  final String Error;

  GetDataErrorState(this.Error);

}
class GetDataLoadingState extends Covid19AppStates {}


// post data
class PostDataSuccessState extends Covid19AppStates {
  final  UserLoginData userLoginModel;

  PostDataSuccessState(this.userLoginModel);
}
class PostDataErrorState extends Covid19AppStates {
  final String Error;

  PostDataErrorState(this.Error);

}
class PostDataLoadingState extends Covid19AppStates {}

// get NewsCovid
class LoadingNewsCovidDataState extends Covid19AppStates {}
class NewsCovidDataSuccessState extends Covid19AppStates {}
class NewsCovidDataErrorState extends Covid19AppStates
{
  final String Error;

  NewsCovidDataErrorState(this.Error);
}
class LoadingGetDataUserState extends Covid19AppStates{}
class GetDataUserStateSuccess extends Covid19AppStates{}
class GetDataUserStateError extends Covid19AppStates{}
