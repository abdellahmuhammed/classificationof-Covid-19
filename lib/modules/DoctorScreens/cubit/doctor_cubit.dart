import 'package:dio/dio.dart';
import 'package:finalproject/models/GetPatientData/GetPatientDataModel.dart';
import 'package:finalproject/models/infectedData/infectedModel.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_state.dart';
import 'package:finalproject/shared/Constant.dart';
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
        PatinetId.add(getInfectedUser.data[i].patientId);
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

  int value;

  void changeRadoIndex(index) {
    value = index;
    emit(ChangeRadioState());
  }





}
