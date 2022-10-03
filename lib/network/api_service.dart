import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hookahorder_admin_web/network/place/place_api_services.dart';
import 'package:hookahorder_admin_web/network/stuff/stuff_api_service.dart';

import 'authorization/authorization_api_service.dart';
import 'interceptors/authorization_header_interceptor.dart';

class ApiClient {
  static final ChopperClient _chopper = ChopperClient(
    baseUrl: dotenv.env['BASE_URL']!,
    converter: const JsonConverter(),
    interceptors: [
      AuthorizationHeaderInterceptor(),
    ],
    services: [
      AuthorizationApiService.create(),
      StuffApiService.create(),
      PlaceApiService.create(),
    ],
  );

  static get getClient => _chopper;
}
