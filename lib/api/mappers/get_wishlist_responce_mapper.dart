import 'package:e_commerce_app/api/mappers/product_mapper.dart';
import 'package:e_commerce_app/api/models/responce/wishlist/getwishlist/get_wishlist_responce_dto.dart';
import 'package:e_commerce_app/domain/entites/responce/products/product.dart';
import 'package:e_commerce_app/domain/entites/responce/wishlist/getwishlist/get_wishlist_responce.dart';

extension GetWishlistResponceMapper on GetWishlistResponceDto{
  GetWishListResponce toGetWishListResponce(){
    return GetWishListResponce(
      status: status,
      data: data?.map<Product>((productDto) => productDto.toProduct() ,).toList()??<Product>[],
      count: count
    );
  }
}