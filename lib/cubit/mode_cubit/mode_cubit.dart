import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/cubit/mode_cubit/mode_states.dart';

class ModeCubit extends Cubit<ModeCubitStates> {
  ModeCubit() : super(lightModeState());
  bool isDark = false;
  void mode() {
    if (isDark) {
      isDark = false;
      emit(lightModeState());
    } else {
      isDark = true;
      emit(darkModeState());
    }
  }

  bool modeIs() {
    return isDark;
  }
}
