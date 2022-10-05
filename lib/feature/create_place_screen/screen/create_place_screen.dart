import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/create_place_screen/controller/create_place_screen_controller.dart';
import 'package:masked_text/masked_text.dart';

class CreatePlaceScreen extends GetView<CreatePlaceScreenController> {
  const CreatePlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 3),
                        const Text("Название,"),
                        TextFormField(
                          controller: controller.placeNameController,
                        ),
                        const SizedBox(height: 3),
                        const Text("Время открытия:"),
                        MaskedTextField(
                          mask: "##:##",
                          controller: controller.startTimeController,
                        ),
                        const SizedBox(height: 3),
                        const Text("Время закрытия:"),
                        MaskedTextField(
                          mask: "##:##",
                          controller: controller.endTimeController,
                        ),
                        const SizedBox(height: 3),
                        const Text("Ссылка на логотип:"),
                        TextFormField(
                          controller: controller.logoUrlController,
                        ),
                        const SizedBox(height: 3),
                        const Text("Страна:"),
                        TextFormField(
                          controller: controller.countryAddressController,
                        ),
                        const SizedBox(height: 3),
                        const Text("Город:"),
                        TextFormField(
                          controller: controller.cityAddressController,
                        ),
                        const SizedBox(height: 3),
                        const Text("Улица:"),
                        TextFormField(
                          controller:
                              controller.streetAddressControllerController,
                        ),
                        const SizedBox(height: 3),
                        const Text("Строение:"),
                        TextFormField(
                          controller: controller.buildingAddressController,
                        ),
                        const SizedBox(height: 3),
                        const Text("Квартира/апартаменты:"),
                        TextFormField(
                          controller: controller.apartmentAddressController,
                        ),
                        const SizedBox(height: 3),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: controller.createPlace,
                              child: const Text("Отправить"),
                            ),
                          ),
                        )
                      ],
                    ),
                ),
          ),
        ),
        onWillPop: () async => true);
  }
}