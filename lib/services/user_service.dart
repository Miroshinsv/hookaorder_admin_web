import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hookahorder_admin_web/feature/stuff_screen/model/user_model.dart';
import 'package:hookahorder_admin_web/network/api_service.dart';
import 'package:hookahorder_admin_web/network/stuff/stuff_api_service.dart';

class UserService extends GetxService {
  late ChopperClient _apiClient;

  @override
  Future<void> onInit() async {
    super.onInit();
    _apiClient = ApiClient.getClient;
  }

  Future<void> getAllUsers() async {
    var resp = await _apiClient.getService<StuffApiService>().getAllUsers();
    print(resp.body);
  }
}
