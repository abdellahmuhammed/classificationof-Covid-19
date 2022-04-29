
abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

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


