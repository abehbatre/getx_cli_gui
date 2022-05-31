// ignore_for_file: always_declare_return_types

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/modules/root_controller.dart';
import 'package:getx_pattern/app/settings/settings.utils.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:recase/recase.dart';

class Menu3Controller extends GetxController {
  final isLoading = false.obs;
  final isChecked = false.obs;

  final tfInput = TextEditingController();

  final shellOutput = ''.obs;
  final rootController = Get.find<RootController>();

  @override
  Future<void> onInit() async {
    isChecked.value = await AppSetting.getIsAutoPutJsonToProject();
    super.onInit();
  }

  Future<void> generateCode(int type) async {
    // validasi
    if (rootController.selectedPath.value.length < 2) {
      ExSnackbar.info(title: 'Path is empty', message: 'Please path to your project');
      return;
    }

    if (tfInput.text.isBlank!) {
      ExSnackbar.warning(title: 'Features name is required', message: 'Please insert model name');
      return;
    }

    isLoading.value = true;
    shellOutput.value = '';
    var objectYangdiAmbil = '';

    if (type == 1) {
      objectYangdiAmbil = 'uri_gen_repo';
    }
    if (type == 2) {
      objectYangdiAmbil = 'uri_gen_api';
    }

    try {
      // ngambil data config
      await Dio().get('https://my-json-server.typicode.com/abehbatre/fake-api/app_gredu_tool_setting').then((config) async {
        // akses data config
        // return shellOutput.value = config.data[objectYangdiAmbil];
        await Dio().get(config.data[objectYangdiAmbil]).then((response) {
          shellOutput.value = response.data
              .toString()
              .replaceAll(
                '@1',
                '${tfInput.text}-repository'.pascalCase,
              )
              .replaceAll(
                '@2',
                '${tfInput.text}'.toLowerCase(),
              );
          isLoading.value = false;
        });
      });
    } on Exception {
      isLoading.value = false;
      shellOutput.value = 'Failed :(';
    }
  }
}
