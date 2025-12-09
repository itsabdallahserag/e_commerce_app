import 'package:e_commerce_app/domain/entites/responce/cart/addcart/add_cart.dart';
class AddCartResponce {
  final String? status;
  final String? message;
  final int? numOfCartItems;
  final String? cartId;
  final AddCart? data;

  AddCartResponce ({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}


