import 'package:e_commerce_app/api/mappers/products_mapper.dart';
import 'package:e_commerce_app/api/models/responce/cart/getcart/get_cart_dto.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/getcart/get_cart.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/getcart/products.dart';

extension GetCartMapper on GetCartDto{
  toGetCart(){
    return GetCart(
      id: id,
      v: v,
      totalCartPrice: totalCartPrice,
      products: products?.map<Products>((productsDto) => productsDto.toProducts() ,).toList() ?? <Products>[],
      cartOwner: cartOwner,
      updatedAt: updatedAt,
        createdAt: createdAt

    );
  }
}