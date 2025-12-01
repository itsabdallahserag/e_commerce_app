import 'package:e_commerce_app/domain/entites/responce/categories/category.dart';
abstract class CategoriesRemoteDataSource{
  Future<List<Category>?> getAllCategories();
}