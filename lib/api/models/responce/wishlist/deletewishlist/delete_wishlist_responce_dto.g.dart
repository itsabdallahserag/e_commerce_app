// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_wishlist_responce_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteWishlistResponceDto _$DeleteWishlistResponceDtoFromJson(
  Map<String, dynamic> json,
) => DeleteWishlistResponceDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$DeleteWishlistResponceDtoToJson(
  DeleteWishlistResponceDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
