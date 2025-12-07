import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_services.dart';
import 'package:e_commerce_app/api/mappers/brands_mapper.dart';
import 'package:e_commerce_app/api/mappers/product_mapper.dart';
import 'package:e_commerce_app/core/exciption/app_exception.dart';
import 'package:e_commerce_app/data/data_sources/remote/brands/brands_remote_data_source.dart';
import 'package:e_commerce_app/domain/entites/responce/brands/brand.dart';
import 'package:e_commerce_app/domain/entites/responce/products/product.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/data_sources/remote/products/products_remote_data_source.dart';
@Injectable(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource{
  final ApiServices apiServices ;
  ProductsRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<List<Product>?> getAllProduct()async {
   try {
   var productsResponce = await apiServices.getAllProduct();
   return productsResponce.data?.map<Product>((e) => e.toProduct(),).toList() ?? <Product>[];
   }on DioException catch (e){
     String? message = e.error is AppException ? (e.error as AppException).message ?? '' : e.message;
     throw ServerException(message: message);
   }
  }

}