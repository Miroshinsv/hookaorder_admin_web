import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/place_screen/model/place_model.dart';
import 'package:hookahorder_admin_web/routes/routes.dart';
import 'package:hookahorder_admin_web/services/place_service.dart';

class PlaceScreenController extends GetxController {
  RxList<PlaceModel> places = <PlaceModel>[].obs;
  RxBool isLoading = true.obs;
  final PlaceService _placeService = Get.find();

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    super.onInit();
    final resp = await _placeService.getAllPlaces();
    if (resp.isSuccessful) {
      places.value = resp.body!;
    }
    isLoading.value = false;
  }

  Future<void> clickCreatePlaceController() async {
    Get.toNamed(Routes.CREATE_PLACE_PAGE);
  }

  Future<void> clickUpdatePlaceController(int placeId) async {
    Get.toNamed(Routes.CREATE_PLACE_PAGE, arguments: placeId);
  }
}
