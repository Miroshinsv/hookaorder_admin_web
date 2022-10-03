import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/stuff_screen/controller/stuff_screen_controller.dart';
import 'package:hookahorder_admin_web/feature/stuff_screen/page/widget/user_card.dart';

class StuffScreen extends GetView<StuffScreenController> {
  const StuffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("add user"),
                  ),
                  Wrap(
                    children: controller.users.isEmpty
                        ? [
                            const Text("Empty user"),
                          ]
                        : controller.users
                            .map((element) => userCardWidget(element))
                            .toList(),
                  ),
                ],
              ),
            ),
    );
  }
}
