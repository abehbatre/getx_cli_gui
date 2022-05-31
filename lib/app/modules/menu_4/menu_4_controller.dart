import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/modules/menu_4/item_menu.dart';
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

  // final a = ''.obs;
  // final b = ''.obs;
  // final c = ''.obs;
  // final d = ''.obs;

  @override
  void onInit() {
    // add setupMenu
    itemMenu
      ..add(ItemModel(title: 'System Path', icon: Icon(MdiIcons.shieldSyncOutline, size: 16)))
      ..add(ItemModel(title: 'Auto Fix Bad Code', icon: Icon(MdiIcons.medicalBag, size: 16)));
    // ..add(ItemModel(title: '', icon: Icon(MdiIcons.medicalBag, size: 16)))
    // ..add(ItemModel(title: 'Fix Bad Code', icon: Icon(MdiIcons.medicalBag, size: 16)));

    super.onInit();
  }

  void itemMenuClick(int index) {
    selectedMenu.value = index;

    switch (index) {
      case 1:
        wTitle.value = '# analyze and auto fix bad code on your project';
        break;
      // case 2:
      //   wTitle.value = '# MENU 2';
      //   break;
      // case 3:
      //   wTitle.value = '# MENU 3';
      //   break;
      default:
        wTitle.value = '# analyze bad code on your project';
    }
  }

  Future<void> runScript(int index) async {
    isLoading.value = true;
    shellOutput.value = '';

    // Menu => Auto Fix Bad Code
    if (index == 1) {
      try {
        shellOutput.value = 'running script..\nmaybe it will take 1-2 minutes, because i will check & fix all your code\n';
        await Process.start(
          'dart',
          ['fix', '--apply'],
          runInShell: true,
          workingDirectory: rootController.selectedPath.value,
        ).then((o) {
          o.stdout.transform(utf8.decoder).listen((event) {
            shellOutput.value += '${event}\n';

            if (event.contains('Nothing to fix!') || event.contains('Applying fixes')) {
              isLoading.value = false;
            }
          });
        });
      } on Exception catch (e) {
        isLoading.value = false;
        shellOutput.value = '$e';
      }
    }

    // Menu => 2
    // if (index == 2) {
    //   try {
    //     await Shell().run('dart fix --apply').then((o) {
    //       isLoading.value = false;
    //       shellOutput.value = o.outText;
    //     });
    //   } on Exception catch (e) {
    //     isLoading.value = false;
    //     shellOutput.value = '$e';
    //   }
    // }
  }

  Future<String> whichSync(String s) async {
    var output = '-';

    await Process.start(
      'where',
      [s],
      runInShell: true,
      workingDirectory: rootController.selectedPath.value,
    ).then((o) {
      o.stdout.transform(utf8.decoder).listen((event) {
        output = event;
      });
    });
    return output;
  }
}
