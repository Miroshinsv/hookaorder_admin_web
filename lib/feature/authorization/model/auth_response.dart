import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
class AuthorizationResponse with _$AuthorizationResponse {
  const factory AuthorizationResponse({
    required String type,
    required String accessToken,
    required String refreshToken,
  }) = _AuthorizationResponse;

  factory AuthorizationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationResponseFromJson(json);
}

extension on AuthorizationResponse{
  String get accessToken => accessToken;
  String get type => type;
}
