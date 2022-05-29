// ignore_for_file: prefer_single_quotes

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pattern/app/resource/color.dart';
import 'package:getx_pattern/app/widgets/code_view/dart_code_viewer.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../settings/settings.utils.dart';
import '../../widgets/ex/index.dart';
import 'menu_3_controller.dart';

class Menu3View extends GetView<Menu3Controller> {
  const Menu3View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => controller.isLoading.value == true ? LinearProgressIndicator() : 0.heightBox),
          genSection(
            tfController: controller.tfInput,
            labelText: 'Template Generator',
            hint: 'ex: inbox',
          ).pSymmetric(h: 16).pOnly(top: 16),
          Wrap(
            children: [
              ExButtonOutline(
                label: 'Repository Template',
                backgroundColor: Colors.transparent,
                borderColor: colorNeutralDark,
                onPressed: () => controller.generateCode(1),
              ).pOnly(right: 10),
              ExButtonOutline(
                label: 'Consume API Template',
                backgroundColor: Colors.transparent,
                borderColor: colorNeutralDark,
                onPressed: () => controller.generateCode(2),
              ).pOnly(right: 10),
            ],
          ).p16(),
          Divider().pOnly(bottom: 10),
          ZStack(
            [
              1.heightBox,
              Obx(
                () => DartCodeViewer(
                  "${controller.shellOutput}",
                  height: 200,
                  backgroundColor: Colors.black,
                  width: double.infinity,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: ExButtonOutline(
                  borderColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  isLabelBold: true,
                  label: 'CLEAR',
                  onPressed: () => controller.shellOutput.value = '',
                ).pOnly(right: 70),
              ),
            ],
          ),
        ],
      ).scrollVertical(),
    );
  }

  Widget genSection({
    required TextEditingController tfController,
    String? labelText,
    String? helperText,
    String? hint,
  }) {
    return VStack(
      [
        if (labelText != null)
          HStack([
            labelText.text.caption(Get.context!).make(),
            Spacer(),
            Obx(
              () => Checkbox(
                value: controller.isChecked.value,
                onChanged: (c) async {
                  if (c != null) {
                    controller.isChecked.value = c;
                    AppSetting.saveIsAutoPutJsonToProject(c);
                  }
                },
              ),
            ),
            'Auto Put Output to Project?'.text.caption(Get.context!).make()
          ])
        else
          0.heightBox,
        4.heightBox,
        HStack(
          [
            ExTextFieldIcon(
              tfController: tfController,
              icon: MdiIcons.databaseSync,
              hint: hint,
            ).expand(),
          ],
        ),
        if (helperText != null) helperText.text.caption(Get.context!).color(colorSuccess[600]!).make().pOnly(top: 8),
      ],
    );
  }
}
