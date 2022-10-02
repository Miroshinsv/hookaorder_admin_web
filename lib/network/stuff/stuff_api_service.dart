import 'package:chopper/chopper.dart';
import 'package:hookahorder_admin_web/feature/authorization_screen/model/auth_request.dart';
import 'package:hookahorder_admin_web/feature/stuff_screen/model/user_model.dart';


part 'stuff_api_service.chopper.dart';

@ChopperApi(baseUrl: "/user")
abstract class StuffApiService extends ChopperService {
  @Post(path: "/create")
  Future<Response> createUser(@Body() UserModel userModel);

  @Get(path: "/get/all")
  Future<Response<List<UserModel>>> getAllUsers();

  @Get(path: "/get/{id}")
  Future<Response<UserModel?>> getUserById(@Path("id") int id);

  static StuffApiService create([ChopperClient? client]) =>
      _$StuffApiService(client);
}
