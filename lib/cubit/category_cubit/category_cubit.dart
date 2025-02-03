import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/cubit/category_cubit/category_cubit_states.dart';
import 'package:k/models/productModel.dart';
import 'package:k/service/get_products_byCategory_service.dart';

class CategoryCubit extends Cubit<CategoriesStates> {
  CategoryCubit() : super(GeneralState());

  void getCategory(String category) async {
    try {
      List<productModel> products =
          await GetProductsBycategoryService().getProductsByCategory(category);
      emit(CategoryState(list: products));
    } catch (e) {
      emit(ErrorState(message: e.toString())); // Handle errors gracefully
    }
  }

  void returnToGeneral() {
    emit(GeneralState());
  }
}
