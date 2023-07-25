import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  final int id;
  final String name;
  final String description;
  final Map<String, String> thumbnail;
  final Map<String, dynamic> comics;

  CharacterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.comics,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
