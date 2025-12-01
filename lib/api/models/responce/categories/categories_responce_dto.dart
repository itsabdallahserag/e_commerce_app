import 'package:e_commerce_app/api/models/responce/categories/category_dto.dart';
import 'package:e_commerce_app/api/models/responce/common/meta_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'categories_responce_dto.g.dart';

@JsonSerializable()
class CategoriesResponceDto {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetaDataDto? metadata;
  @JsonKey(name: "data")
  final List<CategoryDto>? data;

  CategoriesResponceDto ({
    this.results,
    this.metadata,
    this.data,
  });

  factory CategoriesResponceDto.fromJson(Map<String, dynamic> json) {
    return _$CategoriesResponceDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesResponceDtoToJson(this);
  }
}





