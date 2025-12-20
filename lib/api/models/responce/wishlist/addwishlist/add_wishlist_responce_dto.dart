import 'package:json_annotation/json_annotation.dart';

part 'add_wishlist_responce_dto.g.dart';

@JsonSerializable()
class AddWishListResponceDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<String>? data;

  AddWishListResponceDto ({
    this.status,
    this.message,
    this.data,
  });

  factory AddWishListResponceDto.fromJson(Map<String, dynamic> json) {
    return _$AddWishListResponceDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddWishListResponceDtoToJson(this);
  }
}


