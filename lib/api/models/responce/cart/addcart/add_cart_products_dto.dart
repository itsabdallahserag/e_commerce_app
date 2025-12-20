import 'package:json_annotation/json_annotation.dart';
part 'add_cart_products_dto.g.dart';
@JsonSerializable()
class AddCartProductsDto {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "product")
  final String? product;
  @JsonKey(name: "price")
  final int? price;

  AddCartProductsDto ({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  factory AddCartProductsDto.fromJson(Map<String, dynamic> json) {
    return _$AddCartProductsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddCartProductsDtoToJson(this);
  }
}