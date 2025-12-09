import 'package:e_commerce_app/api/models/responce/cart/addcart/add_cart_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_cart_responce_dto.g.dart';

@JsonSerializable()
class AddCartResponceDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cartId")
  final String? cartId;
  @JsonKey(name: "data")
  final AddCartDto? data;

  AddCartResponceDto ({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory AddCartResponceDto.fromJson(Map<String, dynamic> json) {
    return _$AddCartResponceDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddCartResponceDtoToJson(this);
  }
}


