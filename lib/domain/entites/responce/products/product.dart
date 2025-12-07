import 'package:e_commerce_app/api/models/responce/brands/brand_dto.dart';
import 'package:e_commerce_app/api/models/responce/categories/category_dto.dart';
import 'package:e_commerce_app/api/models/responce/products/sub_category_dto.dart';
import 'package:e_commerce_app/domain/entites/responce/brands/brand.dart';
import 'package:e_commerce_app/domain/entites/responce/categories/category.dart';
import 'package:e_commerce_app/domain/entites/responce/products/sub_category.dart';
class Product {
  final int? sold;
  final List<String>? images;
  final List<Subcategory>? subcategory;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final Category? category;
  final Brand? brand;
  final double? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;
  Product ({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });
}