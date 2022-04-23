import 'package:dio/dio.dart';
import 'package:finalproject/models/infectedData/infectedModel.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/remote/DioApi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
  static DoctorCubit get(context)=>BlocProvider.of(context);


  String selectedValue;
  List<String> items = [
    'covid19',
    'Uninfected',
    'Pneumonia',
  ];

  void changeRadioIndex(index){
    selectedValue = index as String;
    emit(ChangeRadioState());
  }

  InfectedModel getInfectedUser ;
  void getLessPro(){
    emit(DoctorLoadingState());
    DioApi.PostData(
        url:
    'api/infected',
        data: FormData.fromMap({
      'action':'fetch',
      'voting_required':'1'
    }
    ),
    token: token
    ).then((value) {
      getInfectedUser=InfectedModel.fromJson(value.data);
      print(getInfectedUser.data[0].patient);
      emit(DoctorSuccessState());

    }).catchError((onError){
      print('Error happednd on ${onError.toString()}');
      emit(DoctorErrorState(onError.toString()));
    });
    
    
  }




}
