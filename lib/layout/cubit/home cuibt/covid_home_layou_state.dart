part of 'covid_home_layou_cubit.dart';

@immutable
abstract class CovidHomeLayouState {}

class CovidHomeLayouInitial extends CovidHomeLayouState {}



class LoadingGetDataOfWorldState extends CovidHomeLayouState {}
class GetDataOfWorldSuccessState extends CovidHomeLayouState {}
class GetDataOfWorldErrorState extends CovidHomeLayouState {
  final String onError;

  GetDataOfWorldErrorState(this.onError);
}



class GetDataOfEgypt extends CovidHomeLayouState {}
class GetDataOfEgyptSuccessState extends CovidHomeLayouState {}
class GetDataOfEgyptErrorState extends CovidHomeLayouState {
  final String onError;

  GetDataOfEgyptErrorState(this.onError);
}



class LoadingGetDataOfCountriesState extends CovidHomeLayouState {}
class GetDataOfCountriesSuccessState extends CovidHomeLayouState {}
class GetDataOfCountriesErrorState extends CovidHomeLayouState {
  final String onError;

  GetDataOfCountriesErrorState(this.onError);
}