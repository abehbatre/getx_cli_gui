import 'package:get/get.dart';

import 'menu_4_controller.dart';

class Menu4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Menu4Controller>(
      () => Menu4Controller(),
    );
  }
}
