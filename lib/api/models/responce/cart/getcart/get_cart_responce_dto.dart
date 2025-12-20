import 'package:e_commerce_app/api/models/responce/cart/getcart/get_cart_dto.dart';
import 'package:e_commerce_app/api/models/responce/products/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_cart_responce_dto.g.dart';

@JsonSerializable()
class GetCartResponceDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cartId")
  final String? cartId;
  @JsonKey(name: "data")
  final GetCartDto? data;

  GetCartResponceDto ({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory GetCartResponceDto.fromJson(Map<String, dynamic> json) {
    return _$GetCartResponceDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetCartResponceDtoToJson(this);
  }
}






