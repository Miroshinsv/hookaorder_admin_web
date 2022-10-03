import 'package:chopper/chopper.dart' as chop;
import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/place_screen/model/place_model.dart';
import 'package:hookahorder_admin_web/network/api_service.dart';
import 'package:hookahorder_admin_web/network/place/place_api_services.dart';

class PlaceService extends GetxService {
  late chop.ChopperClient _apiClient;

  @override
  Future<void> onInit() async {
    super.onInit();
    _apiClient = ApiClient.getClient;
  }

  Future<chop.Response<List<PlaceModel>>> getAllPlaces() async {
    var resp = await _apiClient.getService<PlaceApiService>().getAllPlaces();
    var body = (resp.body as List).map((e) => PlaceModel.fromJson(e)).toList();
    return resp.copyWith(body: body);
  }
}
