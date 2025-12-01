import 'package:e_commerce_app/domain/entites/responce/brands/brand.dart';
import 'package:e_commerce_app/domain/repository/brands/brands_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
@injectable
class BrandsUseCase{
  BrandsRepository brandsRepository ;
  BrandsUseCase({required this.brandsRepository});
  Future<List<Brand>?> invoke () {
    return brandsRepository.getAllBrand();
  }
}