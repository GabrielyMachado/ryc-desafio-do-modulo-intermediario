import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_characters/models/characters/data_model.dart';

part 'response_character_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseCharacterModel {
  String status;
  DataModel data;

  ResponseCharacterModel({
    required this.status,
    required this.data,
  });

  factory ResponseCharacterModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseCharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseCharacterModelToJson(this);
}
