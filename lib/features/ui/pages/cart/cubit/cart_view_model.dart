import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/exciption/app_exception.dart';
import 'package:e_commerce_app/domain/use_cases/cart/addcart/add_cart_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/cart/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CartViewModel extends Cubit<CartStates>{
  AddCartUseCase addCartUseCase;
  CartViewModel({required this.addCartUseCase}):super(CartIntialState());
  static CartViewModel get(context) => BlocProvider.of<CartViewModel>(context);
  int numCartItems = 0 ;
  Future<void> addCart(String productId)async{
    try{
      emit(CartLoadingState());
      var responce = await addCartUseCase.invoke(productId);
      numCartItems = responce.numOfCartItems??0;
      emit(CartSuccesState(numCartItems: numCartItems));
    }on AppException catch(e){
      emit(CartErrorState(message: e.message!));
    }
  }
}