import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/authorization_screen/bindings/auth_screen_bindings.dart';
import 'package:hookahorder_admin_web/feature/authorization_screen/page/auth_screen_controller.dart';
import 'package:hookahorder_admin_web/feature/main_screen/bindings/main_screen_bindings.dart';
import 'package:hookahorder_admin_web/feature/main_screen/page/main_screen_page.dart';


class Routes {
  static const String MAIN_PAGE = "/";
  static const String AUTHORIZATION_PAGE = "/signing";
  final List<GetPage> _routesPageList = [
    GetPage(
      name: AUTHORIZATION_PAGE,
      page: () => const AuthorizationScreenPage(),
      binding: AuthScreenBindings(),
    ),
    GetPage(
        name: MAIN_PAGE,
        page: () => const MainScreePage(),
        binding: MainScreenBindings()),
  ];

  get getPages => _routesPageList;
}
