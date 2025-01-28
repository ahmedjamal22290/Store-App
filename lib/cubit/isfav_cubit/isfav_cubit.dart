import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/cubit/isfav_cubit/isFav_states.dart';

class IsFavCubit extends Cubit<IsFavStates> {
  IsFavCubit() : super(notFav());
  bool isRed = false;
  void IsRed() {
    if (isRed) {
      emit(IsFav());
    } else {
      emit(notFav());
    }
  }
}
