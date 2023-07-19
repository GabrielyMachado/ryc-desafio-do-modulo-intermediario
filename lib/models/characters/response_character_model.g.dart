// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseCharacterModel _$ResponseCharacterModelFromJson(
        Map<String, dynamic> json) =>
    ResponseCharacterModel(
      status: json['status'] as String,
      data: DataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseCharacterModelToJson(
        ResponseCharacterModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data.toJson(),
    };
