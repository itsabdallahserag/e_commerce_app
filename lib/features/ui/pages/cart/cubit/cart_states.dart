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
