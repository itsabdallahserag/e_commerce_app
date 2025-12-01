import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_services.dart';
import 'package:e_commerce_app/api/mappers/category_mapper.dart';
import 'package:e_commerce_app/core/exciption/app_exception.dart';
import 'package:e_commerce_app/data/data_sources/remote/categories/categories_remote_data_source.dart';
import 'package:e_commerce_app/domain/entites/responce/categories/category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final ApiServices apiServices;

  CategoriesRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<Category>?> getAllCategories() async {
    try {
      final response = await apiServices.getAllCategories(); // CategoriesResponceDto
      final data = response.data; // List<CategoryDto>?
      return data?.map<Category>((catDto) => catDto.toCategory()).toList() ?? <Category>[];
    } on DioException catch (e){
      String meesage = (e.error as AppException).message ?? '' ;
      throw ServerException(message: meesage);
    }
  }
}