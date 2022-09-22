import 'package:get/get.dart';
import 'package:untitled/services/auth_service.dart';

import '../feature/authorization/bindings/auth_screen_bindings.dart';
import '../feature/authorization/page/auth_screen_controller.dart';

class Routes {
  static const String MAIN_PAGE = "/";
  static const String AUTHORIZATION_PAGE = "/signing";
  final List<GetPage> _routesPageList = [
    GetPage(
      name: AUTHORIZATION_PAGE,
      page: () => const AuthorizationScreenPage(),
      bindings: [
        AuthScreenBindings(),
      ],
    ),
  ];

  get getPages => _routesPageList;
}
