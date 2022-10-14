import 'package:chopper/src/response.dart' as chop;
import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/role_screen/model/role_model.dart';
import 'package:hookahorder_admin_web/network/api_service.dart';
import 'package:hookahorder_admin_web/network/roles/role_api_services.dart';

class RoleService extends GetxController {
  late Set<RoleModel> _rolesList;
  final RoleApiServices _roleService =
      ApiClient.getClient.getService<RoleApiServices>();

  Future<chop.Response<Set<RoleModel>>> getAllRoles() async {
    var response = await _roleService.getAllRoles();
    if (response.isSuccessful) {
      _rolesList =
          (response.body as List).map((e) => RoleModel.fromJson(e)).toSet();
    }
    return response.copyWith(body: _rolesList);
  }

  Set<RoleModel> get rolesList => _rolesList;
}
