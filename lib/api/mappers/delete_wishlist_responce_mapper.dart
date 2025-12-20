import 'package:e_commerce_app/api/models/responce/wishlist/deletewishlist/delete_wishlist_responce_dto.dart';
import 'package:e_commerce_app/domain/entites/responce/wishlist/deletewishlist/delete_wishlist_responce.dart';

extension DeleteWishlistResponceMapper on DeleteWishlistResponceDto{
  toDeleteWishListResponce(){
    return DeleteWishlistResponce(
      status: status,
      data: data,
      message: message
    );
  }
}