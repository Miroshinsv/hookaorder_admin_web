import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masked_text/masked_text.dart';

import '../controller/auth_screen_controller.dart';

class AuthorizationScreenPage extends GetView<AuthScreenController> {
  const AuthorizationScreenPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: SizedBox(
            height: 500,
            width: 500,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Авторизация",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    MaskedTextField(
                      controller: controller.phoneController,
                      mask: "8##########",
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: "Введите телефон"),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: controller.passwordController,
                      decoration: const InputDecoration(
                        hintText: "Введите пароль",
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 8),
                    Obx(() {
                      return Visibility(
                        visible: !(controller.errorText.value == ""),
                        child: Text(
                          controller.errorText.value,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      );
                    }),
                    TextButton(
                      onPressed: controller.postAuthorization,
                      child: const Text("Отправить"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
