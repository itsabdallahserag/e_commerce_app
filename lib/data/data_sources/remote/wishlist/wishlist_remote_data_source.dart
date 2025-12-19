import 'package:e_commerce_app/domain/entites/responce/wishlist/add_wishlist_responce.dart';

abstract class WishListRemoteDataSource{
  Future<AddWishListResponce> addWishList (String productId);
}