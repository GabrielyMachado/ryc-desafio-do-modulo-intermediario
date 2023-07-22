import 'package:json_annotation/json_annotation.dart';

part 'comics_model.g.dart';

@JsonSerializable()
class ComicsModel {
  final int id;
  final String title;
  @JsonKey(defaultValue: '')
  final String description;
  final Map<String, String> thumbnail;

  ComicsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
  });

  factory ComicsModel.fromJson(Map<String, dynamic> json) =>
      _$ComicsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsModelToJson(this);
}
