
import 'package:finalproject/models/infectedData/infectedModel.dart';

abstract class DoctorState {}

class DoctorInitial extends DoctorState {}
class RadioState extends DoctorState {}

class ChangeRadioState extends DoctorState {}
class ChangeRadioIState extends DoctorState {}
class ChangeRadioBState extends DoctorState {}

class DoctorLoadingState extends DoctorState{}
class DoctorSuccessState extends DoctorState{}
class DoctorErrorState extends DoctorState{
  final Error;

  DoctorErrorState(this.Error);
}

class PatientLoadingState extends DoctorState{}
class PatientSuccessState extends DoctorState{}

class AddVotingLoadingState extends DoctorState{}
class AddVotingSuccessState extends DoctorState{}
class AddVotingErrorState extends DoctorState{
  final Error;

  AddVotingErrorState(this.Error);
}

class voteIsSuccess extends DoctorState{
  final InfectedModel infectedModel;

  voteIsSuccess(this.infectedModel);
}


class CheckLoadingState extends DoctorState{}
class CheckSuccessState extends DoctorState{}
class CheckErrorState extends DoctorState{}


class LoadingGetDoctorDataState extends DoctorState{}
class GetDoctorDataStateSuccess extends DoctorState{}
class GetDoctorDataStateError extends DoctorState{}
