import 'package:get/get.dart';

import 'menu_1_controller.dart';

class Menu1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Menu1Controller>(() => Menu1Controller());
  }
}
