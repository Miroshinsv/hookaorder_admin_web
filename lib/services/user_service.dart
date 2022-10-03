import 'package:chopper/chopper.dart' as chop;
import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/stuff_screen/model/user_model.dart';
import 'package:hookahorder_admin_web/network/api_service.dart';
import 'package:hookahorder_admin_web/network/stuff/stuff_api_service.dart';

class UserService extends GetxService {
  late chop.ChopperClient _apiClient;

  @override
  Future<void> onInit() async {
    super.onInit();
    _apiClient = ApiClient.getClient;
  }

  Future<chop.Response<List<UserModel>>> getAllUsers() async {
    var resp = await _apiClient.getService<StuffApiService>().getAllUsers();
    var body = (resp.body as List).map((e) => UserModel.fromJson(e)).toList();
    return resp.copyWith(body: body);
  }
}
