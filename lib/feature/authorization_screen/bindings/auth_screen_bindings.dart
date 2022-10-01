import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/authorization_screen/controller/auth_screen_controller.dart';
import 'package:hookahorder_admin_web/services/auth_service.dart';


class AuthScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthorizationService());
    Get.lazyPut(() => AuthScreenController());
  }
}