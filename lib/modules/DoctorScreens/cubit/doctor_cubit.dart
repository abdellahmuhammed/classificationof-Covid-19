// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:finalproject/layout/Statistics/statistics%20of%20world%20Screen/statistics%20of%20world.dart';
import 'package:finalproject/models/GetPatientData/GetPatientDataModel.dart';
import 'package:finalproject/models/infectedData/ModelCheck.dart';
import 'package:finalproject/models/infectedData/infectedModel.dart';
import 'package:finalproject/modules/DoctorScreens/DiagnosisScreen/DiagnosisScreen.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_state.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:finalproject/shared/remote/DioApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  static DoctorCubit get(context) => BlocProvider.of(context);


  List <Widget> DocBottomNavBarList= [
     StatisticsOfWorld(),
     DiagnosisScreen(),  //DoctorHomeLayoutScreen(),

  ];

  GetPatientDataModel getDoctorDataModel;

  void getUserProfile( ) {
    emit(LoadingGetDoctorDataState());
    DioApi.PostData(
      url: 'api/users',
      data: FormData.fromMap({
        'action': 'fetch',
        'api_section': 'users',
        'user_id':check,
      }),
      token: token,
    ).then((value) {
      getDoctorDataModel = GetPatientDataModel.fromJson(value.data);
      printFullText(' data successfully ');

      // for(int i=0;i<getPatientDataModel.data.length;i++){
      //   var id =getPatientDataModel.data[i].username;
      //   Id=[id];
      // print(Id);
      // printFullText(' Phone num is ${getPatientDataModel.data[0].phoneNum}');
      // }

      emit(GetDoctorDataStateSuccess());
    }).catchError(( onError) {
      printFullText('Happened Error when get data ${ onError.toString()}');
      emit(GetDoctorDataStateError());

    });
  }

  GetPatientDataModel Test;

  void getUserProfileTest( ) {
    emit(LoadingGetDoctorDataState());
    DioApi.PostData(
      url: 'api/users',
      data: FormData.fromMap({
        'action': 'fetch',
        'api_section': 'users',

      }),
      token: token,
    ).then((value) {
      Test = GetPatientDataModel.fromJson(value.data);
      printFullText(' data successfully ');

      // for(int i=0;i<getPatientDataModel.data.length;i++){
      //   var id =getPatientDataModel.data[i].username;
      //   Id=[id];
      // print(Id);
      // printFullText(' Phone num is ${getPatientDataModel.data[0].phoneNum}');
      // }

      emit(GetDoctorDataStateSuccess());
    }).catchError(( onError) {
      printFullText('Happened Error when get data ${ onError.toString()}');
      emit(GetDoctorDataStateError());

    });
  }

  List<dynamic> PatinetId = [];
  InfectedModel getInfectedUser;

  void getLessPro() {
    emit(DoctorLoadingState());
    DioApi.PostData(
            url: 'api/infected',
            data: FormData.fromMap({'action': 'fetch', 'voting_required': '1'}),
            token: token)
        .then((value) {
      getInfectedUser = InfectedModel.fromJson(value.data);
      for (int i = 0; i < getInfectedUser.data.length; i++) {
        PatinetId.add(getInfectedUser.data[i].ctScans[0].infectedId);
      }
      printFullText('$PatinetId');
      printFullText('${getInfectedUser.data[0].patientId}');
      emit(DoctorSuccessState());
    }).catchError((onError) {
      printFullText('Error happened on ${onError.toString()}');
      emit(DoctorErrorState(onError.toString()));
    });
  }

  List<dynamic> dateOfUser = [];
  GetPatientDataModel getDataForDoctor;

  void getPatientData() {
    for (int j = 0; j < PatinetId.length; j++) {
      emit(PatientLoadingState());
      DioApi.PostData(
          url: 'api/users',
          data: FormData.fromMap({
            'action': 'fetch',
            'api_section': 'users',
            'user_id': PatinetId[j]
          })).then((value) {
        getDataForDoctor = GetPatientDataModel.fromJson(value.data);
        int i = 0;
        do {
          dateOfUser.add(value.data['data'][i]);
          i < PatinetId.length;
        } while (i < 0);

        print(dateOfUser);

        emit(PatientSuccessState());
      }).catchError((onError) {
        print('error happened on ${onError.toString()}');
      });
    }
  }

 String value1;

 Future  changeRadoIndex(index)async {
     value1 = index;
   emit(ChangeRadioState());


  }




  var check=CatchHelper.getData(key: 'check');
  var radioValue=CatchHelper.getData(key: 'value');



  List<dynamic>pa=[];

  void tooMany(index){
    DioApi.PostData(
        url: 'api/infected',
        data: FormData.fromMap({'action': 'fetch', 'voting_required': '1'}),
        token: token)
        .then((value) {
      getInfectedUser = InfectedModel.fromJson(value.data);
      for (int i = 0; i < getInfectedUser.data.length; i++) {
        pa.add(getInfectedUser.data[i].ctScans[0].infectedId);

      }

        DioApi.PostData(url: 'api/voting_for_infection', data: FormData.fromMap({
          'action':'add',
          'infected_id':pa[index],//حاول تحطها اندكس في البارميتر
          'diagnose':value1,
          'doctor_id':check
        })).then((value) {
          emit(voteIsSuccess(getInfectedUser));
          print(value.data['success']);
        });



    });


  }


  InfectedModel GetInfected;
  void addVoting({infectedId}){
    emit(AddVotingLoadingState());
    DioApi.PostData(url: 'api/voting_for_infection', data: FormData.fromMap({
      'action':'add',
      'infected_id':infectedId,//حاول تحطها اندكس في البارميتر
      'diagnose':value1,
      'doctor_id':check,
    })).then((value){


      print('done');
      print('send successfully:${value.data['success']}');
      emit(AddVotingSuccessState());
    }).catchError((onError){
          print('error happened when add voting ${onError.toString()}');
      emit(AddVotingErrorState(onError));
    });


  }




  List<int>RX=[];
  CheckVotingModel CheckVotes;
void CheckPatient(index){
  DioApi.PostData(
      url: 'api/infected',
      data: FormData.fromMap({'action': 'fetch', 'voting_required': '1'}),
      token: token)
      .then((value) {
    getInfectedUser = InfectedModel.fromJson(value.data);
    for (int i = 0; i < getInfectedUser.data.length; i++) {
      RX.add(getInfectedUser.data[i].ctScans[0].infectedId);

    }

    DioApi.PostData(url: 'api/voting_for_infection', data: FormData.fromMap({
      'action':'fetch',
      'infected_id':RX[index],//حاول تحطها اندكس في البارميتر

      'doctor_id':check
    })).then((value) {
      CheckVotes=CheckVotingModel.fromJson(value.data);
      if(CheckVotes.success==true){
        print(CheckVotes.success);
        emit(CheckSuccessState());
      }else{
        print(CheckVotes.success);
        emit(CheckErrorState());
      }
    });



  });


}
void getX(){


}

}


    

/*
*
*                                DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                hint: Text(
                                'Voting',
                                style: TextStyle(
                                fontSize: 30,
                                color: Theme
                                    .of(context)
                                    .hintColor,
                                ),
                                ),
                                items: DoctorCubit.get(context).items
                                    .map((item) =>
                                DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                item,
                                style: const TextStyle(
                                fontSize: 14,
                                ),
                                ),
                                ))
                                    .toList(),
                                value: DoctorCubit.get(context).selectedValue,
                          onChanged: (value) {
                          DoctorCubit.get(context).bbb(value);
                          },
                          buttonHeight: 40,
                          buttonWidth: 140,
                          itemHeight: 40,
                          ),
                          ),

* */




