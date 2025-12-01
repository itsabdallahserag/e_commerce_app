import 'package:e_commerce_app/domain/entites/responce/brands/brand.dart';

abstract class BrandsRemoteDataSource{
  Future<List<Brand>?> getAllBrand();
}