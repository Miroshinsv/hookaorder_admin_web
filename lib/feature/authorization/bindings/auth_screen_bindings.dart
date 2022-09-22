import 'package:get/get.dart';

import '../../../services/auth_service.dart';
import '../controller/auth_screen_controller.dart';

class AuthScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthorizationService());
    Get.lazyPut(() => AuthScreenController());
  }

}