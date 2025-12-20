import 'package:e_commerce_app/domain/entites/responce/cart/addcart/add_cart_products.dart';
class AddCart {
  final String? id;
  final String? cartOwner;
  final List<AddCartProducts>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? totalCartPrice;

  AddCart ({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}