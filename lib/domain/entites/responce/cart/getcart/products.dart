import 'package:e_commerce_app/domain/entites/responce/products/product.dart';

class Products {
  final int? count;
  final String? id;
  final Product? product;
  final int? price;

  Products ({
    this.count,
    this.id,
    this.product,
    this.price,
  });
}