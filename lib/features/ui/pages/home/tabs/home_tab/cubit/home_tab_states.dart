import 'package:e_commerce_app/domain/entites/responce/brands/brand.dart';
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
abstract class BrandsStates{}
class BrandsIntialState extends BrandsStates{}
class BrandsLoadingState extends BrandsStates{}
class BrandsErrorState extends BrandsStates{
  String message ;
  BrandsErrorState({required this.message});
}
class BrandsSuccessState extends BrandsStates{
  List<Brand>? brandsList ;
  BrandsSuccessState({required this.brandsList});
}