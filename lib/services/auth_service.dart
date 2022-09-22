import 'package:chopper/chopper.dart' as chop;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../feature/authorization/model/auth_request.dart';
import '../feature/authorization/model/auth_response.dart';
import '../network/api_service.dart';
import '../network/authorization_api_service.dart';

class AuthorizationService extends GetxService {
  late chop.ChopperClient _apiClient;
  late GetStorage _getStorage;
  AuthorizationResponse? _authorizationResponse;

  AuthorizationResponse get getAuthResponse => _authorizationResponse!;

  @override
  void onInit() async {
    super.onInit();
    await GetStorage.init();
    _getStorage = GetStorage();
    final token = _getStorage.read("BEARER_TOKEN");
    if (token != null) {
      _authorizationResponse = AuthorizationResponse.fromJson(token);
    }
    _apiClient = ApiClient.getClient;
  }

  Future<bool> checkIsUserLogged() async {
    return _authorizationResponse != null;
  }

  Future<chop.Response> postAuthorize(
      AuthorizationRequest authorizationRequest) async {
    var response = await _apiClient
        .getService<AuthorizationApiService>()
        .postAuthorization(authorizationRequest);
    if (response.isSuccessful) {
      _authorizationResponse = AuthorizationResponse.fromJson(response.body);
      _getStorage.write("BEARER_TOKEN", _authorizationResponse!.toJson());
    }
    return response;
  }
}
