import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hookahorder_admin_web/routes/routes.dart';
import 'package:hookahorder_admin_web/theme/hookah_themes.dart';


void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme(),
      themeMode: ThemeMode.light,
      getPages: Routes().getPages,
      initialRoute: Routes.AUTHORIZATION_PAGE,
    );
  }
}
