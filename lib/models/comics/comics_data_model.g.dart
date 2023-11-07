// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comics_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicsDataModel _$ComicsDataModelFromJson(Map<String, dynamic> json) =>
    ComicsDataModel(
      offset: json['offset'] as int,
      limit: json['limit'] as int,
      total: json['total'] as int,
      count: json['count'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => ComicsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicsDataModelToJson(ComicsDataModel instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'total': instance.total,
      'count': instance.count,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
