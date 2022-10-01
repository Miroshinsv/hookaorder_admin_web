import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';

part 'place_model.g.dart';

@freezed
class PlaceModel with _$PlaceModel {
  // final int id;
  // final String name;
  // @JsonKey(name: 'created_at')
  // final DateTime createdAt;
  // @JsonKey(name: 'updated_at')
  // final DateTime updatedAt;
  // @JsonKey(name: 'end_time')
  // final String endTime;
  // @JsonKey(name: 'logo_url')
  // final String logoUrl;

  const factory PlaceModel({
    required int id,
    required String name,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? endTime,
    String? logoUrl,
  }) = _PlaceModel;

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);
}
extension on PlaceModel{
  @JsonKey(name: "created_at")
  String get createdAt => createdAt;
  @JsonKey(name: 'updated_at')
  String get updatedAt => updatedAt;
  int get id => id;
  @JsonKey(name: "logo_url")
  String get logoUrl => logoUrl;
}
