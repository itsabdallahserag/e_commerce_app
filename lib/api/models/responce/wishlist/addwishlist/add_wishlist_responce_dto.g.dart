// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_wishlist_responce_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddWishListResponceDto _$AddWishListResponceDtoFromJson(
  Map<String, dynamic> json,
) => AddWishListResponceDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$AddWishListResponceDtoToJson(
  AddWishListResponceDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
