// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:finalproject/models/GetPatientData/GetPatientDataModel.dart';
import 'package:finalproject/models/infectedData/infectedModel.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_state.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:finalproject/shared/remote/DioApi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  static DoctorCubit get(context) => BlocProvider.of(context);

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
      printFullText('Error happednd on ${onError.toString()}');
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
        print('error happend on ${onError.toString()}');
      });
    }
  }

 String value;

 Future  changeRadoIndex(index)async {
     value = index;
    emit(ChangeRadioState());

  }


  void changeRado(index) {
    value = index;
    emit(ChangeRadioBState());
  }

  void changeRadoBotton(index) {
    value = index;
    emit(ChangeRadioIState());
  }

  var check=CatchHelper.getData(key: 'check');
  var radioValue=CatchHelper.getData(key: 'value');
  var Rvalue;

  dynamic radio (radioValue){

    if (radioValue == 1){
      Rvalue = 'covid19' ;
    }
    else if (radioValue == 2){
      Rvalue = 'Uninfected' ;
    }
   else
    {
      Rvalue = 'Pneumonia' ;
    }


  }
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
          'diagnose':'covid19',
          'doctor_id':check
        })).then((value) {
          emit(voteIsSuccess(getInfectedUser));
          print(value.data['success']);
        });



    });


  }

  void addVoting(){
    emit(AddVotingLoadingState());
    DioApi.PostData(url: 'api/voting_for_infection', data: FormData.fromMap({
      'action':'add',
      'infected_id':11,//حاول تحطها اندكس في البارميتر
      'diagnose':value,
      'doctor_id':check,
    })).then((value){
      print(radioValue);
      print('send successfully:${value.data['success']}');
      emit(AddVotingSuccessState());
    }).catchError((onError){
          print('error happened when add voting ${onError.toString()}');
      emit(AddVotingErrorState(onError));
    });
    
    
  }



}
