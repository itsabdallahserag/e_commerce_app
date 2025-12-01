
import 'package:e_commerce_app/domain/entites/responce/brands/brand.dart';
import 'package:e_commerce_app/domain/entites/responce/common/meta_data.dart';

class BrandsResponce {
  final int? results;
  final MetaData? metadata;
  final List<Brand>? data;
  BrandsResponce ({
    this.results,
    this.metadata,
    this.data,
  });
}



