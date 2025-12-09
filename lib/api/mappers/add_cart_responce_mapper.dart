import 'package:e_commerce_app/api/mappers/add_cart_mapper.dart';
import 'package:e_commerce_app/api/models/responce/cart/addcart/add_cart_responce_dto.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/addcart/add_cart_responce.dart';

extension AddCartResponceMapper on AddCartResponceDto{
  AddCartResponce toAddCartResponce(){
    return AddCartResponce(
      message: message,
      cartId: cartId,
      data: data?.toAddCart(),
      numOfCartItems: numOfCartItems,
      status: status
    );
  }
}