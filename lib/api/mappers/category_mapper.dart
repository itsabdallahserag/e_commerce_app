import 'package:e_commerce_app/api/models/responce/categories/category_dto.dart';
import 'package:e_commerce_app/domain/entites/responce/categories/category.dart';
extension CategoryMapper on CategoryDto{
  toCategory(){
    return Category(
      updatedAt: updatedAt,
      slug: slug,
      id: id,
      createdAt: createdAt,
      image: image,
      name: name
    );
  }
}