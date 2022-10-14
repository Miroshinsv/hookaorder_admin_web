import 'package:chopper/chopper.dart';
import 'package:hookahorder_admin_web/feature/place_screen/model/place_model.dart';

part 'place_api_services.chopper.dart';

@ChopperApi(baseUrl: "/place")
abstract class PlaceApiService extends ChopperService {
  @Get(path: "/get/all")
  Future<Response> getAllPlaces();

  @Get(path: "/get/{id}")
  Future<Response> getPlaceById(@Path("id") int id);

  @Post(path: "/create")
  Future<Response> createPlaces(@Body() PlaceModel place);

  @Post(path: "/update/{placeId}")
  Future<Response> updatePlace(@Body() PlaceModel place, @Path("placeId") int placeId);

  static PlaceApiService create([ChopperClient? client]) =>
      _$PlaceApiService(client);
}
