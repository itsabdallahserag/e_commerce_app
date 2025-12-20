import 'package:json_annotation/json_annotation.dart';

import '../../products/product_dto.dart';
part 'products_dto.g.dart';
@JsonSerializable()
class ProductsDto {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "product")
  final ProductDto? product;
  @JsonKey(name: "price")
  final int? price;

  ProductsDto ({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  factory ProductsDto.fromJson(Map<String, dynamic> json) {
    return _$ProductsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsDtoToJson(this);
  }
}