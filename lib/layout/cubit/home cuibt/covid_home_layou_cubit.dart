import 'package:finalproject/layout/Statistics/StatisticsHomeScreen.dart';
import 'package:finalproject/models/covidStatictsmodel/CovidStatisticsModel.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/remote/covid19WebServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'covid_home_layou_state.dart';

class CovidHomeLayouCubit extends Cubit<CovidHomeLayouState> {

  CovidHomeLayouCubit() : super(CovidHomeLayouInitial());

  static CovidHomeLayouCubit get(context) => BlocProvider.of(context);

  // bottom nav bar for patient

  List <Widget> BottomNavBarList= [
   const Center(child: Text('data')),
    const StatisticsHomeScreen(),
   const Center(child: Text('data')),  //DoctorHomeLayoutScreen(),
  ];

  CovidStatics covidStaticsWorld;

  void getDataOfWorld() {
    emit(LoadingGetDataOfWorldState());
    CovidWebService.getData('v3/covid-19/all', {}).then((value) {
      covidStaticsWorld = CovidStatics.fromJson(value.data);
      // printFullText(value.data.toString());
      //printFullText(covidStaticsWorld.active.toString());
      emit(GetDataOfWorldSuccessState());
    }).catchError((onError) {
      printFullText(
          'error happened when get Data Of World ${onError.toString()}');
      emit(GetDataOfWorldErrorState(onError));
    });
  }

  CovidStatics covidStaticsOfEgypt;

  void getDataOfEgypt() {
    emit(LoadingGetDataOfCountriesState());
    CovidWebService.getData('v3/covid-19/countries/egy', {}).then((value) {
      covidStaticsOfEgypt = CovidStatics.fromJson(value.data);
      printFullText(covidStaticsOfEgypt.country);
      printFullText(covidStaticsOfEgypt.countryInfo.flag);

      emit(GetDataOfCountriesSuccessState());
    }).catchError((onError) {
      printFullText(
          'error happened when get Data Of Countries ${onError.toString()}');
      emit(GetDataOfCountriesErrorState(onError));
    });
  }
}
