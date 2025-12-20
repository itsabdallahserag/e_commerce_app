import 'package:e_commerce_app/domain/entites/responce/wishlist/addwishlist/add_wishlist_responce.dart';
import 'package:e_commerce_app/domain/entites/responce/wishlist/getwishlist/get_wishlist_responce.dart';
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
class GetWishListLoadingState extends WishListStates{}
class GetWishListSuccesState extends WishListStates{
  GetWishListResponce? getWishListResponce;
  GetWishListSuccesState({this.getWishListResponce});
}
class GetWishListErrorState extends WishListStates{
  String message;
  GetWishListErrorState({required this.message});
}
class DeleteWishListLoadingState extends WishListStates{}
class DeleteWishListSuccesState extends WishListStates{
  DeleteWishListSuccesState();
}
class DeleteWishListErrorState extends WishListStates{
  String message;
  DeleteWishListErrorState({required this.message});
}