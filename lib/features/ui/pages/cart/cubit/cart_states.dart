import '../../../../../domain/entites/responce/cart/getcart/get_cart.dart';

abstract class CartStates{}
class CartIntialState extends CartStates{}
class CartLoadingState extends CartStates{}
class CartSuccesState extends CartStates{
  int numCartItems ;
  CartSuccesState({required this.numCartItems});
}
class CartErrorState extends CartStates{
  String message;
  CartErrorState({required this.message});
}
class GetCartLoadingState extends CartStates{}
class GetCartSuccesState extends CartStates{
  GetCart getCart;
  String? message;
  GetCartSuccesState({required this.getCart,this.message});
}
class GetCartErrorState extends CartStates{
  String message;
  GetCartErrorState({required this.message});
}
class DeleteItemLoadingState extends CartStates{}
class DeleteItemSuccesState extends CartStates{
  GetCart getCart;
  DeleteItemSuccesState({required this.getCart});
}
class DeleteItemErrorState extends CartStates{
  String message;
  DeleteItemErrorState({required this.message});
}
class UpdateItemLoadingState extends CartStates{}
class UpdateItemSuccesState extends CartStates{
  GetCart getCart;
  UpdateItemSuccesState({required this.getCart});
}
class UpdateItemErrorState extends CartStates{
  String message;
  UpdateItemErrorState({required this.message});
}
