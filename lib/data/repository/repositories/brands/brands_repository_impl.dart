import 'package:e_commerce_app/data/data_sources/remote/brands/brands_remote_data_source.dart';
import 'package:e_commerce_app/domain/entites/responce/brands/brand.dart';
import 'package:e_commerce_app/domain/entites/responce/brands/brands_responce.dart';
import 'package:e_commerce_app/domain/repository/brands/brands_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BrandsRepository)
class BrandsRepositoryImpl implements BrandsRepository{
  BrandsRemoteDataSource brandsRemoteDataSource;
  BrandsRepositoryImpl({required this.brandsRemoteDataSource});
  @override
  Future<List<Brand>?> getAllBrand() {
    return brandsRemoteDataSource.getAllBrand();
  }

}