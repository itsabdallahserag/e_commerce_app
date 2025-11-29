import 'package:e_commerce_app/data/data_sources/remote/categories/categories_remote_data_source.dart';
import 'package:e_commerce_app/domain/entites/responce/categories/category.dart';
import 'package:e_commerce_app/domain/repository/categories/categories_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository{
  CategoriesRemoteDataSource categoriesRemoteDataSource;
  CategoriesRepositoryImpl({required this.categoriesRemoteDataSource});
  @override
  Future<List<Category>?> getAllCategories() {
    return categoriesRemoteDataSource.getAllCategories();
  }
}