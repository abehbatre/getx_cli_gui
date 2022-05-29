import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/modules/menu_4/item_menu.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../root_controller.dart';

class Menu4Controller extends GetxController {
  final isLoading = false.obs;
  final selectedMenu = 0.obs;

  final tfInput = TextEditingController();
  final itemMenu = <ItemModel>[].obs;

  final wTitle = ''.obs;
  final shellOutput = ''.obs;
  final rootController = Get.find<RootController>();

  @override
  void onInit() {
    // add setupMenu
    itemMenu
      ..add(ItemModel(title: 'System Path', icon: Icon(MdiIcons.shieldSyncOutline, size: 16)))
      ..add(ItemModel(title: 'Flutter Doctor', icon: Icon(MdiIcons.medicalBag, size: 16)));

    super.onInit();
  }

  void itemMenuClick(int index) {
    logW(index);
    selectedMenu.value = index;
  }
}
