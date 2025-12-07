import 'package:e_commerce_app/data/data_sources/remote/brands/brands_remote_data_source.dart';
import 'package:e_commerce_app/data/data_sources/remote/products/products_remote_data_source.dart';
import 'package:e_commerce_app/domain/entites/responce/brands/brand.dart';
import 'package:e_commerce_app/domain/entites/responce/brands/brands_responce.dart';
import 'package:e_commerce_app/domain/entites/responce/products/product.dart';
import 'package:e_commerce_app/domain/repository/brands/brands_repository.dart';
import 'package:e_commerce_app/domain/repository/products/products_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository{
  ProductsRemoteDataSource productsRemoteDataSource;
  ProductsRepositoryImpl({required this.productsRemoteDataSource});
  @override
  Future<List<Product>?> getAllProduct() {
    return productsRemoteDataSource.getAllProduct();
  }

}