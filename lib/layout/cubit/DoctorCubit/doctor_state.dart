// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

part of 'doctor_cubit.dart';

abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class ChangeRadioState extends DoctorState {}
class DoctorLoadingState extends DoctorState{}
class DoctorSuccessState extends DoctorState{}
class DoctorErrorState extends DoctorState{
  final Error;

  DoctorErrorState(this.Error);
}
