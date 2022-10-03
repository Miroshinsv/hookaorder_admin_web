import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {

  const factory UserModel({
    required int id,
    String? name,
    String? email,
    required String phone,
    required bool enabled,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
    @JsonKey(name: "is_enabled")  required bool isEnabled,
    double? rating,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension on UserModel{
  get id => id;
  get name => name;
  get email => email;
  get phone => phone;
  @JsonKey(name: 'created_at')
  get createdAt => createdAt;
  @JsonKey(name: 'updated_at')
  get updatedAt => updatedAt;
  get rating => rating;
}
