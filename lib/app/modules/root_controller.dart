// ------------------------------------------------------------------
import 'package:flutter_desktop_folder_picker/flutter_desktop_folder_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_pattern/app/settings/settings.utils.dart';
import 'package:gredu_common/gredu_common.dart';
import '../utils/snackbar_helper.dart';
import 'menu_1/menu_1_controller.dart';
import 'menu_2/menu_2_controller.dart';
import 'menu_3/menu_3_controller.dart';
import 'menu_4/menu_4_controller.dart';

class RootController extends GetxController {
  final selectedIndex = 0.obs;
  final isLoading = false.obs;

  final title = 'GREDU Flutter Generator'.obs;
  final titlePrefix = 'Module'.obs;
  final footerText = '# Bikin fitur baru semudah inikah?'.obs;
  final subtitle = 'Path: ';
  final selectedPath = '-'.obs;

  @override
  Future<void> onInit() async {
    selectedPath.value = await AppSetting.getCurrentProjectPath();
    isLoading.value = true;
    await AppSetting.checkRequirement();
    isLoading.value = false;

    super.onInit();
  }

  void onNavigationChange(int index) {
    selectedIndex.value = index;

    if (index == 0) {
      titlePrefix.value = 'module'.toTitleCase!;
      footerText.value = '# Bikin fitur baru semudah inikah?';
    }
    if (index == 1) {
      titlePrefix.value = 'JSON to DART'.toTitleCase!;
      footerText.value = '# Konversi JSON ke DART';
    }
    if (index == 2) {
      titlePrefix.value = 'template'.toTitleCase!;
      footerText.value = '# Kumpulan Template';
    }
    if (index == 3) {
      titlePrefix.value = 'tool box'.toTitleCase!;
      footerText.value = '# Command CLI Flutter yang komplex tinggal klik2 aja disini';
    }
  }

  Future<void> dialogSelectPath() async {
    try {
      await FlutterDesktopFolderPicker.openFolderPickerDialog().then((output) async {
        if (output != null) {
          selectedPath.value = output;
          AppSetting.saveCurrentProjectPath(output);
        }
      });
    } on Exception catch (e) {
      SnackbarHelper.danger('$e');
    }
  }
}

// ----
// binding
// ----
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(GetStorage(), permanent: true)
      ..lazyPut<Menu1Controller>(() => Menu1Controller())
      ..lazyPut<Menu2Controller>(() => Menu2Controller())
      ..lazyPut<Menu3Controller>(() => Menu3Controller())
      ..lazyPut<Menu4Controller>(() => Menu4Controller())
      ..lazyPut<RootController>(() => RootController());
  }
}
