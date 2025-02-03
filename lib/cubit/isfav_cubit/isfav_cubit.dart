import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/cubit/isfav_cubit/isFav_states.dart';

class IsFavCubit extends Cubit<IsFavState> {
  IsFavCubit() : super(IsFavInitial());

  final Map<String, bool> _favorites = {};

  void toggleFavorite(String productId, bool isFav) {
    _favorites[productId] = isFav;
    emit(IsFavUpdated(_favorites));
  }

  bool isFavorite(String productId) {
    return _favorites[productId] ?? false;
  }

  Map<String, bool> getFav() {
    return _favorites;
  }
}
