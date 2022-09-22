import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:untitled/network/authorization_header_interceptor.dart';

import 'authorization_api_service.dart';

class ApiClient {
  static var customHeaders = {
    "Access-Control-Allow-Origin": "*",
    // Required for CORS support to work
    "Access-Control-Allow-Credentials": 'true',
    // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS"
  };

  static final ChopperClient _chopper = ChopperClient(
    baseUrl: dotenv.env['BASE_URL']!,
    converter: const JsonConverter(),
    interceptors: [
      HeadersInterceptor(customHeaders),
      AuthorizationHeaderInterceptor(),
    ],
    services: [
      AuthorizationApiService.create(),
    ],
  );

  static get getClient => _chopper;
}
