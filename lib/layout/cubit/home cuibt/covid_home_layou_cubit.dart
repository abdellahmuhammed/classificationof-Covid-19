// ignore_for_file: non_constant_identifier_names

import 'package:finalproject/layout/Statistics/StatisticsHomeScreen.dart';
import 'package:finalproject/models/covidStatictsmodel/CovidStatisticsModel.dart';
import 'package:finalproject/models/getDataOfCountriesModel/getDataOfCountriesModel.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/remote/covid19WebServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'covid_home_layou_state.dart';

class CovidHomeLayouCubit extends Cubit<CovidHomeLayouState> {

  CovidHomeLayouCubit() : super(CovidHomeLayouInitial());

  static CovidHomeLayouCubit get(context) => BlocProvider.of(context);

  // bottom nav bar for patient

  List <Widget> BottomNavBarList=
  [
   const Center(child: Text('data')),
    const StatisticsHomeScreen(),
   const Center(child: Text('data')),  //DoctorHomeLayoutScreen(),
  ];

CovidStatics covidStaticsOfWorld;
  void getStaticsOfWorld() {
    emit(LoadingGetDataOfWorldState());
    CovidWebService.getData('v3/covid-19/historical/all').then((value) {
      covidStaticsOfWorld = CovidStatics.fromJson(value.data);
      printFullText(value.data);
      printFullText(covidStaticsOfWorld.country);
      printFullText(covidStaticsOfWorld.country);
      printFullText(value.data);
      emit(GetDataOfCountriesSuccessState());
    }).catchError((onError){
      printFullText('error happened when get statistics of word ');
      emit(GetDataOfCountriesErrorState(onError));
    });
  }

  CovidStatics covidStaticsOfEgypt;
  void getDataOfEgypt() {
    emit(GetDataOfEgypt());
    CovidWebService.getData('v3/covid-19/countries/egy').then((value) {
      covidStaticsOfEgypt = CovidStatics.fromJson(value.data);
      printFullText(covidStaticsOfEgypt.country);
      printFullText(covidStaticsOfEgypt.countryInfo.flag);
      emit(GetDataOfEgyptSuccessState());
    }).catchError((onError) {
      printFullText(
          'error happened when get Data Of Egypt ${onError.toString()}');
      emit(GetDataOfEgyptErrorState(onError));
    });
  }

  GetDataOfCountriesModel getDataOfCountriesModel;
  void getDataOfCountries(){
    emit(LoadingGetDataOfCountriesState());
    CovidWebService.getData('v3/covid-19/countries/')
        .then((value){
      getDataOfCountriesModel = GetDataOfCountriesModel.fromJson(value.data);
      print(getDataOfCountriesModel);
      emit(GetDataOfCountriesSuccessState());
    })
        .catchError((onError){
      printFullText(
          'error happened when get Data Of Countries ${onError.toString()}');
      emit(GetDataOfCountriesErrorState(onError));
    });
  }


}
