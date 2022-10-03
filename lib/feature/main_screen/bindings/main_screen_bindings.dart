import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/main_screen/controller/main_screen_controller.dart';
import 'package:hookahorder_admin_web/feature/order_screen/controller/order_controller.dart';
import 'package:hookahorder_admin_web/feature/place_screen/controller/place_screen_controller.dart';
import 'package:hookahorder_admin_web/feature/stuff_screen/controller/stuff_screen_controller.dart';
import 'package:hookahorder_admin_web/services/place_service.dart';
import 'package:hookahorder_admin_web/services/user_service.dart';

class MainScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserService());
    Get.put(PlaceService());
    Get.lazyPut(() => MainScreenController());
    Get.lazyPut(() => PlaceScreenController());
    Get.lazyPut(() => OrderScreenController());
    Get.lazyPut(() => PlaceScreenController());
    Get.lazyPut(() => StuffScreenController());
  }
}
