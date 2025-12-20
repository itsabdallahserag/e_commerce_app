import 'package:e_commerce_app/api/models/responce/cart/addcart/add_cart_products_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'add_cart_dto.g.dart';
@JsonSerializable()
class AddCartDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "cartOwner")
  final String? cartOwner;
  @JsonKey(name: "products")
  final List<AddCartProductsDto>? products;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  @JsonKey(name: "totalCartPrice")
  final int? totalCartPrice;

  AddCartDto ({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory AddCartDto.fromJson(Map<String, dynamic> json) {
    return _$AddCartDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddCartDtoToJson(this);
  }
}