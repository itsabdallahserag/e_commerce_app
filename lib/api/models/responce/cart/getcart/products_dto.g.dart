// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsDto _$ProductsDtoFromJson(Map<String, dynamic> json) => ProductsDto(
  count: (json['count'] as num?)?.toInt(),
  id: json['_id'] as String?,
  product: json['product'] == null
      ? null
      : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
  price: (json['price'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductsDtoToJson(ProductsDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      '_id': instance.id,
      'product': instance.product,
      'price': instance.price,
    };
