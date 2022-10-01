import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/authorization_screen/model/auth_request.dart';
import 'package:hookahorder_admin_web/routes/routes.dart';
import 'package:hookahorder_admin_web/services/auth_service.dart';

class AuthScreenController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final AuthorizationService _service;
  RxString errorText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _service = Get.find();
  }

  @override
  void onReady() async {
    if (await _service.checkIsUserLogged()) {
      Get.toNamed(Routes.MAIN_PAGE);
    }
    phoneController.text = "89999999999";
    passwordController.text = "1234567890";
    super.onReady();
  }

  Future<void> postAuthorization() async {
    errorText.value = "";
    final resp = await _service.postAuthorize(
      AuthorizationRequest(
        phone: phoneController.text,
        password: passwordController.text,
      ),
    );
    if (resp.isSuccessful) {
      Get.toNamed(Routes.MAIN_PAGE);
    } else {
      errorText.value = "Неверный логин/пароль";
      Future.delayed(const Duration(seconds: 5))
          .then((value) => errorText.value = "");
    }
  }
}
