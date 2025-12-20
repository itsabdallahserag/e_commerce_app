import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/exciption/app_exception.dart';
import 'package:e_commerce_app/domain/entites/responce/cart/getcart/products.dart';
import 'package:e_commerce_app/domain/use_cases/cart/addcart/add_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/cart/deletecart/delete_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/cart/getcart/get_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/cart/updatecart/update_cart_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/cart/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CartViewModel extends Cubit<CartStates>{
  AddCartUseCase addCartUseCase;
  GetCartUseCase getCartUseCase ;
  DeleteItemCartUseCase deleteItemCartUseCase;
  UpdateItemCartUseCase updateItemCartUseCase;
  CartViewModel({required this.addCartUseCase,required this.getCartUseCase,
  required this.updateItemCartUseCase,required this.deleteItemCartUseCase}):super(CartIntialState());
  static CartViewModel get(context) => BlocProvider.of<CartViewModel>(context);
  int numCartItems = 0 ;
  List<Products> cartList = [] ;
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
  Future<void> getCart()async{
    try{
      emit(GetCartLoadingState());
      var responce = await getCartUseCase.invoke();
      numCartItems = responce.numOfCartItems??0;
      cartList = responce.data!.products!;
      emit(GetCartSuccesState(getCart: responce.data!,message: 'Succes Cart'));
    }on AppException catch(e){
      emit(GetCartErrorState(message: e.message!));
    }
  }
  Future<void> deleteItemInCart(String productId)async{
    try{
      emit(DeleteItemLoadingState());
      var deleteItemResponce = await deleteItemCartUseCase.invoke(productId);
      numCartItems = deleteItemResponce.numOfCartItems??0;
      //cartList = deleteItemResponce.data!.products!;
      emit(GetCartSuccesState(getCart: deleteItemResponce.data!,message: 'product deleted Successfully from cart'));
    }on AppException catch(e){
      emit(DeleteItemErrorState(message: e.message??''));
    }
  }
  Future<void> updateItemInCart(String productId,int count)async{
    try{
      emit(UpdateItemLoadingState());
      var updateItemResponce = await updateItemCartUseCase.invoke(productId,count);
      //numCartItems = updateItemResponce.numOfCartItems??0;
      cartList = updateItemResponce.data!.products!;
      emit(GetCartSuccesState(getCart: updateItemResponce.data!,message: 'product updated Successfully'));
    }on AppException catch(e){
      emit(UpdateItemErrorState(message: e.message!));
    }
  }
}