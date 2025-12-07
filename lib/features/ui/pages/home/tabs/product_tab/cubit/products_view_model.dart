import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/exciption/app_exception.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/product_tab/cubit/products_tab_states.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../domain/use_cases/products/products_use_case.dart';
@injectable
class ProductsViewModel extends Cubit<ProductsTabStates>{
  ProductsUseCase productsUseCase ;
  ProductsViewModel({required this.productsUseCase}):super(ProductsIntialState());
  void getAllProducts()async{
   try{
     emit(ProductsLoadingState());
     var productsList = await productsUseCase.invoke();
     emit(ProductsSuccessState(productsList: productsList));
   }on AppException catch(e){
     emit(ProductsErrorState(message: e.message!));
   }
  }
}