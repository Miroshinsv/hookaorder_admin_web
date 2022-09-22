import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_request.freezed.dart';
part 'auth_request.g.dart';

@freezed
class AuthorizationRequest with _$AuthorizationRequest {
  const factory AuthorizationRequest({
    required String phone,
    required String password,
  }) = _Authorization;

  factory AuthorizationRequest.fromJson(Map<String, Object?> json) => _$AuthorizationRequestFromJson(json);
}
