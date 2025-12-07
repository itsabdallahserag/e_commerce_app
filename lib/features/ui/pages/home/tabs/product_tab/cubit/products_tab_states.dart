import 'package:e_commerce_app/domain/entites/responce/products/product.dart';
abstract class ProductsTabStates{}
class ProductsIntialState extends ProductsTabStates{}
class ProductsLoadingState extends ProductsTabStates{}
class ProductsErrorState extends ProductsTabStates{
  String message ;
  ProductsErrorState({required this.message});
}
class ProductsSuccessState extends ProductsTabStates{
  List<Product>? productsList ;
  ProductsSuccessState({required this.productsList});
}