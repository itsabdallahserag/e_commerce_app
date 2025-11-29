
import 'package:e_commerce_app/domain/entites/responce/categories/category.dart';
abstract class CategoriesRepository{
  Future<List<Category>?> getAllCategories();
}