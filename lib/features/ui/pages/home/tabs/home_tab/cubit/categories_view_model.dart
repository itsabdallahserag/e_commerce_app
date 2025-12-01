import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/exciption/app_exception.dart';
import 'package:e_commerce_app/domain/use_cases/categories/categories_use_case.dart';
import 'package:e_commerce_app/features/ui/pages/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:injectable/injectable.dart';
@injectable
class CategoriesViewModel extends Cubit<CategoriesStates>{
  CategoriesViewModel({required this.categoriesUseCase}):super(CategoriesIntialState());
  CategoriesUseCase categoriesUseCase ;
  void getAllCategories()async{
    try{
      emit(CategoriesLoadingState());
      var categoriesList = await categoriesUseCase.invoke();
      emit(CategoriesSuccessState(categoriesList: categoriesList));
    }on AppException catch(e){
      emit(CategoriesErrorState(message: e.message??''));
    }
  }
}