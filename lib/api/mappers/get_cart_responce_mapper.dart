import 'package:e_commerce_app/api/mappers/get_cart_mapper.dart';
import 'package:e_commerce_app/api/models/responce/cart/getcart/get_cart_responce_dto.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/getcart/get_cart_responce.dart';

extension GetCartResponceMapper on GetCartResponceDto{
  toGetCartResponce(){
    return GetCartResponce(
      status: status,
      numOfCartItems: numOfCartItems,
      data: data?.toGetCart(),
      cartId: cartId
    );
  }
}