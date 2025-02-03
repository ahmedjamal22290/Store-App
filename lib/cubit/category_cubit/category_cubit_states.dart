import 'package:k/models/productModel.dart';

// Abstract Base Class for all states
abstract class CategoriesStates {}

class GeneralState extends CategoriesStates {}

class CategoryState extends CategoriesStates {
  final List<productModel> list;
  CategoryState({required this.list});
}

// Optional: Add Error State for better error handling
class ErrorState extends CategoriesStates {
  final String message;
  ErrorState({required this.message});
}
