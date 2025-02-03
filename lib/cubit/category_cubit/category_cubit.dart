import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/cubit/category_cubit/category_cubit_states.dart';

class categoryCubit extends Cubit<categoryState> {
  categoryCubit() : super(generalState());
}
