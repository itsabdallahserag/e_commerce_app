// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_responce_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponceDto _$CategoriesResponceDtoFromJson(
  Map<String, dynamic> json,
) => CategoriesResponceDto(
  results: (json['results'] as num?)?.toInt(),
  metadata: json['metadata'] == null
      ? null
      : MetaDataDto.fromJson(json['metadata'] as Map<String, dynamic>),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoriesResponceDtoToJson(
  CategoriesResponceDto instance,
) => <String, dynamic>{
  'results': instance.results,
  'metadata': instance.metadata,
  'data': instance.data,
};
