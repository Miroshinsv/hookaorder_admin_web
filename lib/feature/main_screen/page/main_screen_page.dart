import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookahorder_admin_web/feature/dashboard_screen/screen/dashboard_screen.dart';
import 'package:hookahorder_admin_web/feature/main_screen/controller/main_screen_controller.dart';
import 'package:hookahorder_admin_web/feature/order_screen/screen/order_screen.dart';
import 'package:hookahorder_admin_web/feature/place_screen/page/place_screen.dart';
import 'package:hookahorder_admin_web/feature/stuff_screen/page/stuff_screen.dart';

class MainScreePage extends GetView<MainScreenController> {
  const MainScreePage({super.key});

  static const List<Widget> _tabs = [
    DashboardScreen(),
    StuffScreen(),
    PlaceScreen(),
    OrderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
      ),
      body: Obx(() {
        return _tabs[controller.currentSelectedIndex.value];
      }),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("user"),
                      Text("logout"),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Dashboard'),
              onTap: () {
                controller.selectIndex(0);
              },
            ),
            ListTile(
                title: const Text('Stuff'),
                onTap: () {
                  controller.selectIndex(1);
                }),
            ListTile(
                title: const Text('Places'),
                onTap: () {
                  controller.selectIndex(2);
                }),
            ListTile(
                title: const Text('Orders'),
                onTap: () {
                  controller.selectIndex(3);
                }),
          ],
        ),
      ),
    );
  }
}
