import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:get/get.dart' as get_x;

import '../services/auth_service.dart';

class AuthorizationHeaderInterceptor implements RequestInterceptor {
  final AuthorizationService _authorizationService = get_x.Get.find();

  @override
  FutureOr<Request> onRequest(Request request) async {
    if (await _authorizationService.checkIsUserLogged()) {
      request.headers['Authorization'] =
          "${_authorizationService.getAuthResponse.type} ${_authorizationService.getAuthResponse.accessToken}";
    }
    return request;
  }
}
