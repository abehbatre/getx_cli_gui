import 'package:get/get.dart';

import 'menu_2_controller.dart';

class Menu2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Menu2Controller>(
      () => Menu2Controller(),
    );
  }
}
