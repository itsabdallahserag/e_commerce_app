import 'package:json_annotation/json_annotation.dart';

part 'delete_wishlist_responce_dto.g.dart';

@JsonSerializable()
class DeleteWishlistResponceDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<String>? data;

  DeleteWishlistResponceDto ({
    this.status,
    this.message,
    this.data,
  });

  factory DeleteWishlistResponceDto.fromJson(Map<String, dynamic> json) {
    return _$DeleteWishlistResponceDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeleteWishlistResponceDtoToJson(this);
  }
}


