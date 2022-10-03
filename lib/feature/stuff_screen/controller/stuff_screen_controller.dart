import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/stuff_screen/model/user_model.dart';
import 'package:hookahorder_admin_web/services/user_service.dart';

class StuffScreenController extends GetxController {
  RxList<UserModel> users = <UserModel>[].obs;
  final UserService userService = Get.find();
  RxBool isLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    var resp = await userService.getAllUsers();
    if (resp.isSuccessful) {
      users.value = resp.body!;
    }
    isLoading.value = false;
  }
}
