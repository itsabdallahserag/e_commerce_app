import 'package:e_commerce_app/api/models/responce/products/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_wishlist_responce_dto.g.dart';

@JsonSerializable()
class GetWishlistResponceDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "data")
  final List<ProductDto>? data;

  GetWishlistResponceDto ({
    this.status,
    this.count,
    this.data,
  });

  factory GetWishlistResponceDto.fromJson(Map<String, dynamic> json) {
    return _$GetWishlistResponceDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetWishlistResponceDtoToJson(this);
  }
}




