// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brands_responce_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandsResponceDto _$BrandsResponceDtoFromJson(Map<String, dynamic> json) =>
    BrandsResponceDto(
      results: (json['results'] as num?)?.toInt(),
      metadata: json['metadata'] == null
          ? null
          : MetaDataDto.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BrandDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BrandsResponceDtoToJson(BrandsResponceDto instance) =>
    <String, dynamic>{
      'results': instance.results,
      'metadata': instance.metadata,
      'data': instance.data,
    };
