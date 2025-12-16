// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_products_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCartProductsDto _$AddCartProductsDtoFromJson(Map<String, dynamic> json) =>
    AddCartProductsDto(
      count: (json['count'] as num?)?.toInt(),
      id: json['_id'] as String?,
      product: json['product'] as String?,
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddCartProductsDtoToJson(AddCartProductsDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      '_id': instance.id,
      'product': instance.product,
      'price': instance.price,
    };
