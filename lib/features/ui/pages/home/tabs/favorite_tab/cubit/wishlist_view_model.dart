import 'package:e_commerce_app/core/exciption/app_exception.dart';
import 'package:e_commerce_app/domain/entites/responce/products/product.dart';
import 'package:e_commerce_app/domain/use_cases/wishlist/addwishlist/add_wishlist_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/wishlist/deletewishlist/delete_wishlist_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/wishlist/getwishlist/get_wishlist_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/favorite_tab/cubit/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class WishListViewModel extends Cubit<WishListStates>{
  AddWishListUseCase addWishListUseCase;
  GetWishListUseCase getWishListUseCase ;
  DeleteItemWishListUseCase deleteItemWishListUseCase ;
  WishListViewModel({required this.addWishListUseCase,required this.getWishListUseCase,required this.deleteItemWishListUseCase}):super(WishListIntialState());
  static WishListViewModel get(context) => BlocProvider.of<WishListViewModel>(context);
  List<Product> wishList = [] ;
  Future<void> addWishList(String productId)async{
    try{
      emit(AddWishListLoadingState());
      var addWishlistResponce = await addWishListUseCase.invoke(productId);
      var message = addWishlistResponce.message ;
      emit(AddWishListSuccesState(addWishlistResponce: addWishlistResponce,message: message??''));
    }on AppException catch(e){
      emit(AddWishListErrorState(message: e.message??''));
    }
  }
  Future<void> getWishList()async{
    try{
      emit(GetWishListLoadingState());
      var getWishListResponce = await getWishListUseCase.invoke();
      wishList = getWishListResponce.data??[];
      emit(GetWishListSuccesState(getWishListResponce: getWishListResponce));
    }on AppException catch(e){
      emit(GetWishListErrorState(message: e.message??''));
    }
  }
  Future<void> deleteProductFromWishList(String productId) async {
    try {
      emit(DeleteWishListLoadingState());
      await deleteItemWishListUseCase.invoke(productId);
      emit(DeleteWishListSuccesState());
      await getWishList();
    } on AppException catch (e) {
      emit(DeleteWishListErrorState(message: e.message ?? ''));
    }
  }
}


















/*
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
 */