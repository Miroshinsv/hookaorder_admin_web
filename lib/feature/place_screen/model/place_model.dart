// ignore_for_file: recursive_getters

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hookahorder_admin_web/feature/place_screen/model/address_model.dart';
import 'package:hookahorder_admin_web/feature/stuff_screen/model/user_model.dart';

part 'place_model.freezed.dart';

part 'place_model.g.dart';

@freezed
class PlaceModel with _$PlaceModel {
  const factory PlaceModel({
    int? id,
    required String name,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "end_time") String? endTime,
    @JsonKey(name: "start_time") String? startTime,
    @JsonKey(name: "logo_url") String? logoUrl,
    UserModel? owner,
    Set<UserModel>? staff,
    required AddressModel address,
  }) = _PlaceModel;

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);
}

extension on PlaceModel {
  String get createdAt => createdAt;

  String get updatedAt => updatedAt;

  int get id => id;

  String get logoUrl => logoUrl;

  String get endTime => endTime;

  String get startTime => startTime;

  String get name => name;

  String get stuff => stuff;

  String get owner => owner;
}
