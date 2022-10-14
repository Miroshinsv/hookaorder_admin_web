import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_model.freezed.dart';

part 'role_model.g.dart';

@freezed
class RoleModel with _$RoleModel {
  const factory RoleModel(
      {required int id,
      @JsonKey(name: "role_name") required String roleName}) = _RoleModel;

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);
}

extension on RoleModel {
  get id => id;

  get roleName => roleName;
}
