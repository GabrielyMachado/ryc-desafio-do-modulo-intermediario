import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_characters/models/comics/comics_model.dart';

part 'comics_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ComicsDataModel {
  int offset;
  int limit;
  int total;
  int count;
  List<ComicsModel> results;

  ComicsDataModel({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory ComicsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ComicsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsDataModelToJson(this);
}
