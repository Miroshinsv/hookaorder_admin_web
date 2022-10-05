import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/authorization_screen/bindings/auth_screen_bindings.dart';
import 'package:hookahorder_admin_web/feature/authorization_screen/page/auth_screen_controller.dart';
import 'package:hookahorder_admin_web/feature/create_place_screen/bindings/create_place_binding.dart';
import 'package:hookahorder_admin_web/feature/create_place_screen/screen/create_place_screen.dart';
import 'package:hookahorder_admin_web/feature/main_screen/bindings/main_screen_bindings.dart';
import 'package:hookahorder_admin_web/feature/main_screen/page/main_screen_page.dart';

class Routes {
  static const String MAIN_PAGE = "/";
  static const String AUTHORIZATION_PAGE = "/signing";
  static const String CREATE_PLACE_PAGE = "/creteplace";
  final List<GetPage> _routesPageList = [
    GetPage(
      name: AUTHORIZATION_PAGE,
      page: () => const AuthorizationScreenPage(),
      binding: AuthScreenBindings(),
    ),
    GetPage(
      name: MAIN_PAGE,
      page: () => const MainScreePage(),
      binding: MainScreenBindings(),
    ),
    GetPage(
      name: CREATE_PLACE_PAGE,
      page: () => const CreatePlaceScreen(),
      binding: CreatePlaceScreenBinding(),
    ),
  ];

  get getPages => _routesPageList;
}
