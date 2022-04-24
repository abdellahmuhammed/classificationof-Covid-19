// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
@immutable
abstract class PatientStates {}

class Covid19AppInitial extends PatientStates {}
class ChangeShowPasswordState extends PatientStates {}
class ChangeBottomNavBarState extends PatientStates {}

// get PatientProfile

class LoadingGetDataUserState extends PatientStates{}
class GetDataUserStateSuccess extends PatientStates{}
class GetDataUserStateError extends PatientStates{}


// update PatientProfile


class LoadingUpdateDataUserState extends PatientStates{}
class UpdateDataUserStateSuccess extends PatientStates{}
class UpdateDataUserStateError extends PatientStates{
  final String onError;

  UpdateDataUserStateError(this.onError);
}


