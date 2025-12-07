import 'package:e_commerce_app/domain/entites/responce/products/product.dart';
abstract class ProductsRepository{
  Future<List<Product>?> getAllProduct();
}