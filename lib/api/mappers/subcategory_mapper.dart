import 'package:e_commerce_app/api/models/responce/products/sub_category_dto.dart';
import 'package:e_commerce_app/domain/entites/responce/products/sub_category.dart';

extension SubcategoryMapper on SubcategoryDto{
  Subcategory toSubCategory(){
    return Subcategory(
      category: category,
      id: id,
      slug: slug,
      name: name
    );
  }
}