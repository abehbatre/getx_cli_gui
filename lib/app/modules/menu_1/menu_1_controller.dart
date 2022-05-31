import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
// import 'package:process_run/shell.dart';

import '../root_controller.dart';

class Menu1Controller extends GetxController {
  final isLoading = false.obs;
  final tfInput = TextEditingController();
  final shellOutput = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> generate() async {
    final rootController = Get.find<RootController>();
    if (rootController.selectedPath.value.length < 2) {
      ExSnackbar.info(title: 'Path is empty', message: 'Please path to your project');
      return;
    }

    if (tfInput.text.isBlank!) {
      ExSnackbar.warning(title: 'Module name is required', message: 'Please insert module name');
      return;
    }

    isLoading.value = true;
    try {
      shellOutput.value = '';
      await Process.start(
        'get',
        ['create', 'page:${tfInput.text}'],
        runInShell: true,
        workingDirectory: rootController.selectedPath.value,
      ).then((o) {
        o.stdout.transform(utf8.decoder).listen((event) {
          isLoading.value = false;
          shellOutput.value += '${event}';
          tfInput.text = '';
        });
      });
    } on Exception catch (e) {
      isLoading.value = false;
      ExSnackbar.danger(message: '$e');
    }
  }
}
