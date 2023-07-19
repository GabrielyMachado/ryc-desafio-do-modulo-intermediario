// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_comics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseComicsModel _$ResponseComicsModelFromJson(Map<String, dynamic> json) =>
    ResponseComicsModel(
      status: json['status'] as String,
      data: ComicsDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseComicsModelToJson(
        ResponseComicsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data.toJson(),
    };
