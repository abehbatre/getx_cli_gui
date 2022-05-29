import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:process_run/shell.dart';

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
      final shell = Shell(
        workingDirectory: rootController.selectedPath.value,
      );

      await shell.run('get create page:${tfInput.text}').then((o) {
        isLoading.value = false;
        shellOutput.value = '${o.outText}';
        tfInput.text = '';
        // ExSnackbar.success(title: 'Success', message: 'Module created ...');
      });
    } on Exception catch (e) {
      isLoading.value = false;
      ExSnackbar.danger(message: '$e');
    }
  }
}
