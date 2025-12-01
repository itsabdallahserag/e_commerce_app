import 'package:e_commerce_app/api/models/responce/brands/brand_dto.dart';
import 'package:e_commerce_app/api/models/responce/common/meta_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brands_responce_dto.g.dart';

@JsonSerializable()
class BrandsResponceDto {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetaDataDto? metadata;
  @JsonKey(name: "data")
  final List<BrandDto>? data;

  BrandsResponceDto ({
    this.results,
    this.metadata,
    this.data,
  });

  factory BrandsResponceDto.fromJson(Map<String, dynamic> json) {
    return _$BrandsResponceDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BrandsResponceDtoToJson(this);
  }
}



