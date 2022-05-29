import 'package:get/get.dart';

import '../modules/menu_1/menu_1_binding.dart';
import '../modules/menu_1/menu_1_view.dart';
import '../modules/menu_2/menu_2_binding.dart';
import '../modules/menu_2/menu_2_view.dart';
import '../modules/menu_3/menu_3_binding.dart';
import '../modules/menu_3/menu_3_view.dart';
import '../modules/menu_4/menu_4_binding.dart';
import '../modules/menu_4/menu_4_view.dart';
import '../modules/root_controller.dart';
import '../modules/root_view.dart';

part 'app_routes.dart';

///
class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => RootView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MENU_1,
      page: () => Menu1View(),
      binding: Menu1Binding(),
    ),
    GetPage(
      name: _Paths.MENU_2,
      page: () => Menu2View(),
      binding: Menu2Binding(),
    ),
    GetPage(
      name: _Paths.MENU_3,
      page: () => Menu3View(),
      binding: Menu3Binding(),
    ),
    GetPage(
      name: _Paths.MENU_4,
      page: () => Menu4View(),
      binding: Menu4Binding(),
    ),
  ];
}
