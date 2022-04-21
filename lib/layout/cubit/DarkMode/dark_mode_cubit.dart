import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'dark_mode_state.dart';

class DarkModeCubit extends Cubit<DarkModeStates> {
  DarkModeCubit() : super(DarkModeInitial());

  static DarkModeCubit get(context) => BlocProvider.of(context);

  var isDarkShow = false;

  void changeAppMode({bool formShared}) {
    if (formShared != null) {
      isDarkShow = formShared;
      emit(ChangeAppModeState());
    } else {
      isDarkShow = !isDarkShow;
      CatchHelper.saveData(key: 'isDarkShow', value: isDarkShow).then((value) {
        printFullText('isDarkShow is $isDarkShow');
        printFullText('Change Dark Mode saved Successfully');
        emit(ChangeAppModeState());
      });
    }
  }
}
