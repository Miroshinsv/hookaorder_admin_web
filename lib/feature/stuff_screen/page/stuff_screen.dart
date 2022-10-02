import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hookahorder_admin_web/feature/stuff_screen/controller/stuff_screen_controller.dart';

class StuffScreen extends GetView<StuffScreenController> {
  const StuffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const Text("Stuff"),
    );
  }
}
