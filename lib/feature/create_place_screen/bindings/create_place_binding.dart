import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/create_place_screen/controller/create_place_screen_controller.dart';
import 'package:hookahorder_admin_web/services/place_service.dart';
import 'package:hookahorder_admin_web/services/role_service.dart';

class CreatePlaceScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePlaceScreenController());
    Get.lazyPut(() => PlaceService());
    Get.lazyPut(() => RoleService());
  }
}
