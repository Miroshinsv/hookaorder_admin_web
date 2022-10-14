import 'package:chopper/chopper.dart' as chop;
import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/place_screen/model/place_model.dart';
import 'package:hookahorder_admin_web/network/api_service.dart';
import 'package:hookahorder_admin_web/network/place/place_api_services.dart';

class PlaceService extends GetxService {
  late PlaceApiService _apiClient;

  @override
  Future<void> onInit() async {
    super.onInit();
    _apiClient = ApiClient.getClient.getService<PlaceApiService>();
  }

  Future<chop.Response<List<PlaceModel>>> getAllPlaces() async {
    var resp = await _apiClient.getAllPlaces();
    var body = <PlaceModel>[];
    if (resp.isSuccessful) {
      body = (resp.body as List).map((e) => PlaceModel.fromJson(e)).toList();
    }
    return resp.copyWith(body: body);
  }

  Future<chop.Response<PlaceModel>> getPlaceById(int id) async {
    var resp = await _apiClient.getPlaceById(id);
    return resp.copyWith(body: PlaceModel.fromJson(resp.body));
  }

  Future<chop.Response<PlaceModel>> createPlace(PlaceModel model) async {
    var resp = await _apiClient.createPlaces(model);
    return resp.copyWith(body: PlaceModel.fromJson(resp.body));
  }

  Future<chop.Response<PlaceModel>> updatePlace(PlaceModel model) async {
    var resp = await _apiClient.updatePlace(model, model.id!);
    return resp.copyWith(body: PlaceModel.fromJson(resp.body));
  }
}
