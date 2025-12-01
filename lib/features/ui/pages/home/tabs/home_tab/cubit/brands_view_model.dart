import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/exciption/app_exception.dart';
import 'package:e_commerce_app/domain/use_cases/brands/brands_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../domain/entites/responce/brands/brand.dart';
@injectable
class BrandsViewModel extends Cubit<BrandsStates>{
  BrandsUseCase brandsUseCase ;
  BrandsViewModel({required this.brandsUseCase}):super(BrandsIntialState());
  void getAllBrand()async{
   try{
     emit(BrandsLoadingState());
     var brandsList = await brandsUseCase.invoke();
     emit(BrandsSuccessState(brandsList: brandsList));
   }on AppException catch(e){
     emit(BrandsErrorState(message: e.message!));
   }
  }
}