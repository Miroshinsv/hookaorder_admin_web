import 'package:get/get.dart';

class MainScreenController extends GetxController {
  RxInt currentSelectedIndex = 0.obs;

  Future<void> selectIndex(int index) async {
    currentSelectedIndex.value = index;
  }
}
