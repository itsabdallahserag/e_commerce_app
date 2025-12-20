// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wishlist_responce_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWishlistResponceDto _$GetWishlistResponceDtoFromJson(
  Map<String, dynamic> json,
) => GetWishlistResponceDto(
  status: json['status'] as String?,
  count: (json['count'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetWishlistResponceDtoToJson(
  GetWishlistResponceDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'count': instance.count,
  'data': instance.data,
};
