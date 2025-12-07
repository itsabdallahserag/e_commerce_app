import 'package:e_commerce_app/api/models/responce/common/meta_data_dto.dart';
import 'package:e_commerce_app/api/models/responce/products/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_responce_dto.g.dart';

@JsonSerializable()
class ProductsResponceDto {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetaDataDto? metadata;
  @JsonKey(name: "data")
  final List<ProductDto>? data;

  ProductsResponceDto ({
    this.results,
    this.metadata,
    this.data,
  });

  factory ProductsResponceDto.fromJson(Map<String, dynamic> json) {
    return _$ProductsResponceDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsResponceDtoToJson(this);
  }
}


