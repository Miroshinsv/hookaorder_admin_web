import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/stuff_screen/model/user_model.dart';
import 'package:hookahorder_admin_web/services/user_service.dart';

class StuffScreenController extends GetxController {
  late List<UserModel> users;
  final UserService userService = Get.find();
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await userService.getAllUsers();
  }
}
