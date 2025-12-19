import 'package:e_commerce_app/api/models/responce/wishlist/add_wishlist_responce_dto.dart';
import 'package:e_commerce_app/domain/entites/responce/wishlist/add_wishlist_responce.dart';

extension AddWishlistResponceMapper on AddWishListResponceDto{
  AddWishListResponce toAddWishListResponce(){
    return AddWishListResponce(
      message: message,
      data: data,
      status: status
    );
  }
}