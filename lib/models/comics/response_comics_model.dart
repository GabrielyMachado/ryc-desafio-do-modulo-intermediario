import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_characters/models/comics/comics_data_model.dart';

part 'response_comics_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseComicsModel {
  String status;
  ComicsDataModel data;

  ResponseComicsModel({
    required this.status,
    required this.data,
  });

  factory ResponseComicsModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseComicsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseComicsModelToJson(this);
}
