import 'package:e_commerce_app/domain/entites/responce/common/meta_data.dart';
import 'package:e_commerce_app/domain/entites/responce/products/product.dart';

class ProductsResponce {
  final int? results;
  final MetaData? metadata;
  final List<Product>? data;

  ProductsResponce ({
    this.results,
    this.metadata,
    this.data,
  });
}


