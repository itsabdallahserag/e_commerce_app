import 'package:e_commerce_app/domain/entites/responce/brands/brand.dart';
import 'package:e_commerce_app/domain/entites/responce/brands/brands_responce.dart';

abstract class BrandsRepository{
  Future<List<Brand>?> getAllBrand();
}