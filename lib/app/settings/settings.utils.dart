// ignore_for_file: avoid_positional_boolean_parameters

// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_pattern/app/data/constans.dart';
// import 'package:getx_pattern/app/modules/menu_1/menu_1_controller.dart';
// import 'package:gredu_common/gredu_common.dart';
// import 'package:getx_pattern/app/resource/color.dart';
// import 'package:gredu_common/gredu_common.dart';
// import 'package:process_run/shell.dart';

class SettingsThemeMode {
  const SettingsThemeMode();
  static const light = 'light';
  static const dark = 'dark';
  static const system = 'system';
}

ThemeMode getThemeMode(String themeMode) {
  if (themeMode == SettingsThemeMode.light) {
    return ThemeMode.light;
  } else if (themeMode == SettingsThemeMode.dark) {
    return ThemeMode.dark;
  } else {
    return ThemeMode.system;
  }
}

mixin AppSetting {
  // inject pref
  static final pref = Get.find<GetStorage>();

  // project path
  static Future<String> getCurrentProjectPath() async => await pref.read(kPrefPath);
  static void saveCurrentProjectPath(String value) => pref.write(kPrefPath, value);

  // auto put json to project?
  static Future<bool> getIsAutoPutJsonToProject() async => await pref.read(kPrefAutoPutModelToProject);
  static void saveIsAutoPutJsonToProject(bool value) => pref.write(kPrefAutoPutModelToProject, value);

  // first open
  static Future<void> checkRequirement({bool reCheck = false}) async {
    // final isFI = pref.read(kIsFirstInstall) ?? true;
    // final controller = Get.find<Menu1Controller>();

    // if (isFI || reCheck) {
    //   logI('im called ..');
    //   final shell = Shell();
    //   controller.isLoading.value = true;
    //   // try 1
    //   try {
    //     await shell.run('get --version').then((o) {
    //       ExSnackbar.success(message: 'your device all-ready setup and use last version. so, lets go bitch!');
    //       pref.write(kIsFirstInstall, false);
    //       controller.isLoading.value = false;
    //     });
    //   } on Exception {
    //     ExSnackbar.danger(message: 'Try to install missing packanges ...');
    //     // final shell = Shell();

    //     // try 2
    //     try {
    //       await shell.run(
    //         '''
    //       pub global activate get_cli 
    //       flutter pub global activate get_cli
    //       ''',
    //       ).then((value) {
    //         ExSnackbar.success(message: 'your device all-ready setup and use last version. so, lets go bitch!');
    //         controller.isLoading.value = false;
    //       });
    //     } on Exception catch (e) {
    //       controller.isLoading.value = false;
    //       ExAlert.error(
    //         title: 'GAK SUPPORT !!',
    //         message: '$e',
    //         titleTextColor: colorWhite,
    //         messageTextColor: colorWhite,
    //         onYes: () {
    //           exit(0); // force close app
    //         },
    //       );
    //     }
    //   }
    // }
  }
}
