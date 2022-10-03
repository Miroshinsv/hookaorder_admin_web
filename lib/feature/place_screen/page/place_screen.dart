import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/place_screen/controller/place_screen_controller.dart';
import 'package:hookahorder_admin_web/feature/place_screen/page/widget/place_widget.dart';

class PlaceScreen extends GetView<PlaceScreenController> {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.add),
                      label: const Text("Добавить кальянную"),
                    ),
                    Wrap(
                      children: controller.places.isEmpty
                          ? [
                              const Text("Empty places"),
                            ]
                          : controller.places
                              .map(
                                (element) => placeWidget(element),
                              )
                              .toList(),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
