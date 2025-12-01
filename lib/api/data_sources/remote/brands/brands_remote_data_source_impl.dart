import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_services.dart';
import 'package:e_commerce_app/api/mappers/brands_mapper.dart';
import 'package:e_commerce_app/core/exciption/app_exception.dart';
import 'package:e_commerce_app/data/data_sources/remote/brands/brands_remote_data_source.dart';
import 'package:e_commerce_app/domain/entites/responce/brands/brand.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BrandsRemoteDataSource)
class BrandsRemoteDataSourceImpl implements BrandsRemoteDataSource{
  final ApiServices apiServices ;
  BrandsRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<List<Brand>?> getAllBrand()async {
   try {
     var brandResponce = await apiServices.getAllBrand();
     return brandResponce.data?.map<Brand>((brandDto) => brandDto.toBrand(),).toList() ?? <Brand>[];
   }on DioException catch (e){
     String? message = e.error is AppException ? (e.error as AppException).message ?? '' : e.message;
     throw ServerException(message: message);
   }
  }

}