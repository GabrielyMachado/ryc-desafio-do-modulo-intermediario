import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_characters/models/character_model.dart';

part 'data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DataModel {
  int offset;
  int limit;
  int total;
  int count;
  List<CharacterModel> results;

  DataModel({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
