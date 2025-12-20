import 'package:e_commerce_app/api/models/responce/cart/addcart/add_cart_products_dto.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/addcart/add_cart_products.dart';

extension AddCartProductsMapper on AddCartProductsDto{
  toAddCartProducts(){
    return AddCartProducts(
      id: id,
      price: price,
      count: count,
      product: product
    );
  }
}