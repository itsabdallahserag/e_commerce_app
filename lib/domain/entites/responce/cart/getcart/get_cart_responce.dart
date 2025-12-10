import 'package:e_commerce_app/domain/entites/responce/cart/getcart/get_cart.dart';

class GetCartResponce {
  final String? status;
  final int? numOfCartItems;
  final String? cartId;
  final GetCart? data;

  GetCartResponce ({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}






