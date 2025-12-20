// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_responce_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartResponceDto _$GetCartResponceDtoFromJson(Map<String, dynamic> json) =>
    GetCartResponceDto(
      status: json['status'] as String?,
      numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
      cartId: json['cartId'] as String?,
      data: json['data'] == null
          ? null
          : GetCartDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCartResponceDtoToJson(GetCartResponceDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'numOfCartItems': instance.numOfCartItems,
      'cartId': instance.cartId,
      'data': instance.data,
    };
