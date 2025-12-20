import 'package:e_commerce_app/domain/entites/responce/wishlist/addwishlist/add_wishlist_responce.dart';
import 'package:e_commerce_app/domain/entites/responce/wishlist/deletewishlist/delete_wishlist_responce.dart';
import 'package:e_commerce_app/domain/entites/responce/wishlist/getwishlist/get_wishlist_responce.dart';

abstract class WishListRepository{
  Future<AddWishListResponce> addWishList (String productId);
  Future<GetWishListResponce> getWishList ();
  Future<DeleteWishlistResponce> deleteProductFromWishList (String productId);
}