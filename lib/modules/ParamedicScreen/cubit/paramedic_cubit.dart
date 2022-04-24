import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'paramedic_state.dart';

class ParamedicCubit extends Cubit<ParamedicState> {
  ParamedicCubit() : super(ParamedicInitial());
}
