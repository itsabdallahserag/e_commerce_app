import 'package:e_commerce_app/domain/entites/responce/categories/category.dart';
import 'package:e_commerce_app/domain/entites/responce/products/product.dart';
import 'package:e_commerce_app/domain/repository/categories/categories_repository.dart';
import 'package:e_commerce_app/domain/repository/products/products_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductsUseCase{
  ProductsRepository productsRepository ;
  ProductsUseCase({required this.productsRepository});
  Future<List<Product>?> invoke (){
    return productsRepository.getAllProduct();
  }
}