import 'package:e_commerce_app/api/models/responce/brands/brand_dto.dart';
import 'package:e_commerce_app/domain/entites/responce/brands/brand.dart';

extension BrandsMapper on BrandDto{
  toBrand(){
    return Brand(
      name: name,
      image: image,
      createdAt: createdAt,
      id: id,
      slug: slug,
        updatedAt: updatedAt
    );
  }
}