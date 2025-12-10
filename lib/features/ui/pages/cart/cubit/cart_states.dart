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
  GetCartSuccesState({required this.getCart});
}
class GetCartErrorState extends CartStates{
  String message;
  GetCartErrorState({required this.message});
}
