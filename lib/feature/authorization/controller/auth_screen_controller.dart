import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/feature/authorization/model/auth_request.dart';
import 'package:untitled/services/auth_service.dart';

class AuthScreenController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthorizationService _service = Get.find();
  RxString errorText = ''.obs;

  @override
  void onReady()async {
    if(await _service.checkIsUserLogged()){
      print("loggined");
    } else {
      print('not');
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
    } else {
      errorText.value = "Неверный логин/пароль";
      Future.delayed(const Duration(seconds: 5))
          .then((value) => errorText.value = "");
    }
  }
}
