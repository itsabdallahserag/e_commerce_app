import 'package:e_commerce_app/domain/entites/responce/wishlist/add_wishlist_responce.dart';
abstract class WishListStates{}
class WishListIntialState extends WishListStates{}
class AddWishListLoadingState extends WishListStates{}
class AddWishListSuccesState extends WishListStates{
  String?message;
  AddWishListResponce addWishlistResponce;
  AddWishListSuccesState({required this.addWishlistResponce,this.message});
}
class AddWishListErrorState extends WishListStates{
  String message;
  AddWishListErrorState({required this.message});
}