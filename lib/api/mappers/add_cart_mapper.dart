import 'package:e_commerce_app/api/mappers/add_cart_products_mapper.dart';
import 'package:e_commerce_app/api/models/responce/cart/addcart/add_cart_dto.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/addcart/add_cart.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/addcart/add_cart_products.dart';

extension AddCartMapper on AddCartDto{
  toAddCart(){
    return AddCart(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      cartOwner: cartOwner,
      products: products?.map<AddCartProducts>((productsDto) => productsDto.toAddCartProducts() ).toList()??<AddCartProducts>[],
      totalCartPrice: totalCartPrice,
      v: v
    );
  }
}