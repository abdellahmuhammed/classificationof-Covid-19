import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  static DoctorCubit get(context) => BlocProvider.of(context);

  String selectedValue;
  List<String> items = [
    'covid19',
    'Uninfected',
    'Pneumonia',
  ];

  void changeRadioIndex(index) {
    selectedValue = index as String;
    emit(ChangeRadioState());
  }
}
