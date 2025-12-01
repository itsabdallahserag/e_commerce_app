import 'package:e_commerce_app/domain/entites/responce/categories/category.dart';
import 'package:e_commerce_app/domain/repository/categories/categories_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class CategoriesUseCase{
  CategoriesRepository categoriesRepository;
  CategoriesUseCase({required this.categoriesRepository});
  Future<List<Category>?> invoke (){
    return categoriesRepository.getAllCategories();
  }
}