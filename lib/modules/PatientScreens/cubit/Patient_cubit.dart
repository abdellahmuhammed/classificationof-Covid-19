// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:finalproject/models/GetPatientData/GetPatientDataModel.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_state.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:finalproject/shared/remote/DioApi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/Constant.dart';

class PatientCubit extends Cubit<PatientStates> {
  PatientCubit() : super(PatientInitial());

  static PatientCubit get(context) => BlocProvider.of(context);

var check=CatchHelper.getData(key: 'check');
// to get data
//   List <dynamic>Id=[];

  GetPatientDataModel getPatientDataModel;

  void getUserProfile( ) {
    emit(LoadingGetPatientDataState());
    DioApi.PostData(
      url: 'api/users',
      data: FormData.fromMap({
        'action': 'fetch',
        'api_section': 'users',
        'user_id':check,
      }),
      token: token,
    ).then((value) {
      getPatientDataModel = GetPatientDataModel.fromJson(value.data);
      printFullText(' data successfully ');

      // for(int i=0;i<getPatientDataModel.data.length;i++){
      //   var id =getPatientDataModel.data[i].username;
      //   Id=[id];
      // print(Id);
      // printFullText(' Phone num is ${getPatientDataModel.data[0].phoneNum}');
      // }

      emit(GetPatientDataStateSuccess());
    }).catchError(( onError) {
      printFullText('Happened Error when get data ${ onError.toString()}');
      emit(GetPatientDataStateError());

    });
  }

  // void UpdateUserProfile(email, password, username, dob, gender, address, phone_num,
  //     ssn, role_id)
  // {
  //   emit(LoadingUpdateDataUserState());
  //     DioApi.PostData(
  //       url: 'api/users',
  //       data: FormData.fromMap({
  //         'api_section': 'users',
  //         'action': 'edit',
  //         'email': email,
  //         'password': password,
  //         'username': username,
  //         'gender': gender,
  //         'dob': dob,
  //         'address': address,
  //         'phone_num': phone_num,
  //         'ssn': ssn,
  //         'role_id': role_id,
  //       })).then((value) {
  //     printFullText(value.data.toString());
  //     getPatientDataModel = GetUserDataModel.fromJson(value.data);
  //     printFullText('update successfully');
  //     emit(UpdateDataUserStateSuccess());
  //   }).catchError((onError) {
  //     printFullText('Error Happened when update user data ${onError.toString()}');
  //     emit(UpdateDataUserStateError(onError.toString()));
  //   });
  // }

}
