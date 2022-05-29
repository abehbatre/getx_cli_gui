import 'package:get/get.dart';

import 'menu_3_controller.dart';

class Menu3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Menu3Controller>(
      () => Menu3Controller(),
    );
  }
}
