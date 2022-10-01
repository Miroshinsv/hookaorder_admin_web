import 'package:chopper/chopper.dart';


part 'place_api_services.chopper.dart';

@ChopperApi(baseUrl: "/place")
abstract class PlaceApiService extends ChopperService {

  static PlaceApiService create([ChopperClient? client]) =>
      _$PlaceApiService(client);
}