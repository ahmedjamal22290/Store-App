import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/cubit/isfav_cubit/isFav_states.dart';
import 'package:k/models/productModel.dart';

class IsFavCubit extends Cubit<IsFavState> {
  IsFavCubit() : super(IsFavInitial());

  final Map<String, bool> _favorites = {};
  final List<productModel> _listFav = [];
  void toggleFavorite(productModel product, bool isFav) {
    _favorites[product.id.toString()] = isFav;
    if (isFav) {
      _listFav.add(product);
    } else {
      int index = _listFav.indexOf(product);
      _listFav.removeAt(index);
    }
    emit(IsFavUpdated(_favorites));
  }

  bool isFavorite(String productId) {
    return _favorites[productId] ?? false;
  }

  List<productModel> getFav() {
    return _listFav;
  }
}
