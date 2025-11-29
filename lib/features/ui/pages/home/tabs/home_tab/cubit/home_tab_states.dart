import 'package:e_commerce_app/domain/entites/responce/categories/category.dart';

abstract class CategoriesStates{}
class CategoriesIntialState extends CategoriesStates{}
class CategoriesLoadingState extends CategoriesStates{}
class CategoriesErrorState extends CategoriesStates{
  String message ;
  CategoriesErrorState({required this.message});
}
class CategoriesSuccessState extends CategoriesStates{
  List<Category>? categoriesList ;
  CategoriesSuccessState({required this.categoriesList});
}