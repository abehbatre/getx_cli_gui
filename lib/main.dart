import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_pattern/app/data/constans.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:window_manager/window_manager.dart';

import 'app/resource/theme.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  // Transparency compatibility for windows & linux
  if (!(Platform.isMacOS || Platform.isLinux)) {
    await Window.initialize();
  }

  if (!(Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    exit(0);
  }

  const initialSize = Size(800, 500);
  await windowManager.setMinimumSize(initialSize);
  await windowManager.setSize(initialSize);
  if (!Platform.isMacOS) await windowManager.setAsFrameless();

  doWhenWindowReady(() {
    appWindow.minSize = initialSize;
    appWindow.maxSize = Size(900, 500);
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });

  await GetStorage.init(); // local storage
  await ExLog.init(); // custom Logger

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      theme: darkTheme,
      darkTheme: darkTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
