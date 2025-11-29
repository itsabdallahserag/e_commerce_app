import 'package:e_commerce_app/domain/entites/responce/categories/category.dart';
import 'package:e_commerce_app/domain/entites/responce/common/meta_data.dart';
class CategoriesResponce {
  final int? results;
  final MetaData? metadata;
  final List<Category>? data;

  CategoriesResponce ({
    this.results,
    this.metadata,
    this.data,
  });
}


