import 'package:chopper/chopper.dart';
import 'package:untitled/feature/authorization/model/auth_request.dart';
import 'package:untitled/feature/authorization/model/auth_response.dart';

part 'authorization_api_service.chopper.dart';

@ChopperApi(baseUrl: "/auth")
abstract class AuthorizationApiService extends ChopperService {
  @Post(path: "/login")
  Future<Response> postAuthorization(
      @Body() AuthorizationRequest request);

  static AuthorizationApiService create([ChopperClient? client]) =>
      _$AuthorizationApiService(client);
}
