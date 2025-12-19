import 'package:e_commerce_app/domain/entites/responce/wishlist/add_wishlist_responce.dart';

abstract class WishListRepository{
  Future<AddWishListResponce> addWishList (String productId);
}