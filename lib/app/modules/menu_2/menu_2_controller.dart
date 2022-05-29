// ignore_for_file: cascade_invocations

import 'dart:io';

import 'package:click_to_copy/click_to_copy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/resource/color.dart';
import 'package:getx_pattern/app/settings/settings.utils.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:process_run/shell.dart';

import '../root_controller.dart';

class Menu2Controller extends GetxController {
  final isLoading = false.obs;

  final tfInput = TextEditingController();
  final tfJson = TextEditingController();
  final isChecked = false.obs;

  final shellOutput = ''.obs;
  final shellOutputColor = colorSuccess.obs;

  final rootController = Get.find<RootController>();

  @override
  Future<void> onInit() async {
    isChecked.value = await AppSetting.getIsAutoPutJsonToProject();
    super.onInit();
  }

  Future<void> generate() async {
    // validasi
    if (rootController.selectedPath.value.length < 2) {
      ExSnackbar.info(title: 'Path is empty', message: 'Please path to your project');
      return;
    }

    if (tfInput.text.isBlank!) {
      ExSnackbar.warning(title: 'Module name is required', message: 'Please insert model name');
      return;
    }

    // reset state
    isLoading.value = true;
    shellOutputColor.value = colorSuccess;

    try {
      // step 1 : save text to folder tmp with file name from ${tfInput.text}
      await _writeFile(tfInput.text, tfJson.text);

      // step 2 : get generate model on lib/app/models with tmp/${tfInput.text}.json --skipProvider
      try {
        final shell = Shell(workingDirectory: rootController.selectedPath.value);

        // step ++ : auto put output to project?
        if (isChecked.value) {
          // create folder lib/app/models
          try {
            final dir = Directory('${rootController.selectedPath.value}/lib/app/models');
            dir.createSync(recursive: true);
          } catch (e) {
            shellOutput.value += '$e';
          }
          await shell.run('get generate model on lib/app/models with lib/tmp/${tfInput.text}.json --skipProvider').then((o) {
            shellOutput.value += 'step 2 : otw generate.. \n';
            shellOutput.value += '${o.outText} \n';
          });
        } else {
          await shell.run('get generate model on lib/tmp with lib/tmp/${tfInput.text}.json --skipProvider').then((o) {
            shellOutput.value += 'step 2 : otw generate.. \n';
            shellOutput.value += '${o.outText} \n';
          });
        }
      } on Exception catch (e) {
        ExSnackbar.danger(message: '$e');
      }

      // step 3 : read output file and print to ${shellOutput}
      await _readFile(tfInput.text);

      // step 4 : delete file tmp
      await _deleteFile(tfInput.text);

      // task done
      isLoading.value = false;
      // tfInput.text = '';
      if (isChecked.value) {
        shellOutput.value = "task done, model generate on : 'lib/app/models/${tfInput.text}_model.dart'";
      }
    } on Exception {
      isLoading.value = false;
      shellOutputColor.value = colorError;
    }
  }

  // --------------------------------------------------------------------------------
  // private function
  // --------------------------------------------------------------------------------

  Future<void> _writeFile(String fileName, String content) async {
    // create folder tmp
    try {
      final dir = Directory('${rootController.selectedPath.value}/lib/tmp');
      dir.createSync(recursive: true);
    } catch (e) {
      shellOutput.value += '$e';
    }

    // create dummy file
    final _filePath = '${rootController.selectedPath.value}/lib/tmp/${fileName}.json';
    final file = File(_filePath);
    try {
      await file.writeAsString('$content', flush: true);
      shellOutput.value = 'step 1 : check format ...\n';
    } on Exception catch (e) {
      ExSnackbar.danger(message: '$e');
      shellOutput.value = '$e';
    }
  }

  Future<void> _readFile(String fileName) async {
    try {
      final _filePath = '${rootController.selectedPath.value}/lib/tmp/${fileName}_model.dart';
      final file = File(_filePath);

      // Read the file
      final contents = await file.readAsString();
      shellOutput.value = contents;
    } catch (e) {
      shellOutput.value += '$e';
    }
  }

  Future<void> _deleteFile(String fileName) async {
    try {
      final _filePath = '${rootController.selectedPath.value}/lib/tmp/${fileName}';
      final file1 = File('${_filePath}.json');
      final file2 = File('${_filePath}_model.dart');
      final dir = Directory('${rootController.selectedPath.value}/lib/tmp');
      logI(dir);
      await file1.delete();
      await file2.delete();
      dir.deleteSync(recursive: true);
    } catch (e) {
      shellOutput.value += '$e';
    }
  }

  Future<void> copyOutputToClipboard() async {
    try {
      await ClickToCopy.copy(shellOutput.value).then((value) {
        ExSnackbar.success(message: 'Output Copied ...');
      });
    } on Exception {
      ExSnackbar.danger(message: 'Failed :"))');
    }
  }
}
