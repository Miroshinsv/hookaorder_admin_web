import 'package:chopper/chopper.dart';
part 'role_api_services.chopper.dart';
@ChopperApi(baseUrl: "/roles")
abstract class RoleApiServices extends ChopperService{

  @Get(path: "/get/all")
  Future<Response> getAllRoles();

  static RoleApiServices create([ChopperClient? client]) =>
      _$RoleApiServices(client);

}