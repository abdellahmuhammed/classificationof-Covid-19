
abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class ChangeRadioState extends DoctorState {}

class DoctorLoadingState extends DoctorState{}
class DoctorSuccessState extends DoctorState{}
class DoctorErrorState extends DoctorState{
  final Error;

  DoctorErrorState(this.Error);
}
