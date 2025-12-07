import 'package:e_commerce_app/api/mappers/brands_mapper.dart';
import 'package:e_commerce_app/api/mappers/category_mapper.dart';
import 'package:e_commerce_app/api/mappers/subcategory_mapper.dart';
import 'package:e_commerce_app/api/models/responce/brands/brand_dto.dart';
import 'package:e_commerce_app/api/models/responce/products/product_dto.dart';
import 'package:e_commerce_app/domain/entites/responce/brands/brand.dart';
import 'package:e_commerce_app/domain/entites/responce/products/product.dart';
import 'package:e_commerce_app/domain/entites/responce/products/sub_category.dart';

extension ProductMapper on ProductDto{
  toProduct(){
    return Product(
      updatedAt: updatedAt,
      slug: slug,
      id: id,
      createdAt: createdAt,
      title: title,
      brand: brand!.toBrand(),
      category: category!.toCategory(),
      description: description,
      imageCover: imageCover,
      images: images,
      price: price,
      quantity: quantity,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      sold: sold,
      subcategory: subcategory?.map<Subcategory>((e) => e.toSubCategory(),).toList() ?? <Subcategory>[]
    );
  }
}