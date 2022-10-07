import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/place_screen/controller/place_screen_controller.dart';
import 'package:hookahorder_admin_web/feature/place_screen/model/address_model.dart';
import 'package:hookahorder_admin_web/feature/place_screen/model/place_model.dart';
import 'package:hookahorder_admin_web/services/place_service.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';

class CreatePlaceScreenController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxnString errorText = RxnString();
  final PlaceService _placeService = Get.find();
  final TextEditingController placeNameController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController logoUrlController = TextEditingController();
  final YandexGeocoder _geocoder =
      YandexGeocoder(apiKey: dotenv.env['GEOCODING_API_KEY']!);
  late int? placeId;

  // Address controllers
  final TextEditingController countryAddressController =
      TextEditingController();
  final TextEditingController cityAddressController = TextEditingController();
  final TextEditingController streetAddressControllerController =
      TextEditingController();
  final TextEditingController buildingAddressController =
      TextEditingController();
  final TextEditingController apartmentAddressController =
      TextEditingController();
  final TextEditingController latAddressController = TextEditingController();
  final TextEditingController lngAddressController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    placeId = Get.arguments;
    if (placeId != null) {
      final resp = await _placeService.getPlaceById(placeId!);
      if (resp.isSuccessful) {
        final body = resp.body!;
        placeNameController.text = body.name;
        startTimeController.text = body.startTime ?? "";
        endTimeController.text = body.endTime ?? "";
        logoUrlController.text = body.logoUrl ?? "";
        countryAddressController.text = body.address.country ?? "";
        cityAddressController.text = body.address.city;
        streetAddressControllerController.text = body.address.street;
        apartmentAddressController.text = body.address.apartment ?? "";
      } else {
        errorText.value = resp.error as String?;
        Future.delayed(const Duration(seconds: 10))
            .then((value) => errorText.value = null);
      }
    }
    isLoading.value = false;
  }

  Future<void> createPlace() async {
    final GeocodeResponse geocodeFromAddress =
        await _geocoder.getGeocode(GeocodeRequest(
      geocode: AddressGeocode(
          address:
              '${countryAddressController.text} ${cityAddressController.text} ${streetAddressControllerController.text} ${buildingAddressController.text} ${apartmentAddressController.text} '),
      lang: Lang.ru,
    ));
    final placeModel = PlaceModel(
      name: placeNameController.text,
      endTime: endTimeController.text,
      startTime: startTimeController.text,
      logoUrl: logoUrlController.text == "" ? null : logoUrlController.text,
      address: AddressModel(
        country: countryAddressController.text,
        city: cityAddressController.text,
        street: streetAddressControllerController.text,
        building: buildingAddressController.text,
        lat: geocodeFromAddress.firstPoint!.latitude,
        lng: geocodeFromAddress.firstPoint!.longitude,
      ),
    );
    final resp = placeId == null
        ? await _placeService.createPlace(placeModel)
        : await _placeService.updatePlace(placeModel);
    if (resp.isSuccessful) {
      Get.find<PlaceScreenController>().onInit();
      Get.back();
    } else {
      errorText.value = resp.error.toString();
    }
  }
}
