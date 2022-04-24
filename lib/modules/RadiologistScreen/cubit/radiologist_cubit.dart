import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'radiologist_state.dart';

class RadiologistCubit extends Cubit<RadiologistState> {
  RadiologistCubit() : super(RadiologistInitial());
}
