import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/place_screen/controller/place_screen_controller.dart';

class PlaceScreen extends GetView<PlaceScreenController> {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: null,
              icon: Icon(Icons.add),
              label: Text("Добавить кальянную"),
            ),
          ],
        ),
      ),
    );
  }
}
