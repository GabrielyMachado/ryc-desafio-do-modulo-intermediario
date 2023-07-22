// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicsModel _$ComicsModelFromJson(Map<String, dynamic> json) => ComicsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      thumbnail: Map<String, String>.from(json['thumbnail'] as Map),
    );

Map<String, dynamic> _$ComicsModelToJson(ComicsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
    };
