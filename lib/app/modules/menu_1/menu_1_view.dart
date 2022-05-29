import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pattern/app/resource/color.dart';
import 'package:getx_pattern/app/widgets/ex/index.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'menu_1_controller.dart';

class Menu1View extends GetView<Menu1Controller> {
  const Menu1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: Column(
        children: [
          Obx(() => controller.isLoading.value == true ? LinearProgressIndicator() : 0.heightBox),
          VStack(
            [
              genSection(
                tfController: controller.tfInput,
                labelText: 'Generate New Features',
                // helperText: '* format: snake_case, and you can make subfolder ()',
                hint: 'ex: notification_list',
                onPressed: () => controller.generate(),
              ),
              Divider().pSymmetric(v: 10),
              ZStack(
                [
                  Obx(
                    () => '${controller.shellOutput}'.selectableText.make().p12().wh(double.infinity, 200).backgroundColor(Vx.black).cornerRadius(4),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ExButtonOutline(
                      borderColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      isLabelBold: true,
                      label: 'CLEAR',
                      onPressed: () => controller.shellOutput.value = '',
                    ),
                  ),
                ],
              ),
            ],
          ).p16(),
        ],
      ).scrollVertical(),
    );
  }

  Widget genSection({
    required TextEditingController tfController,
    String? labelText,
    String? helperText,
    String? hint,
    required Function onPressed,
  }) {
    return VStack(
      [
        if (labelText != null) labelText.text.caption(Get.context!).make().pOnly(bottom: 8),
        HStack(
          [
            ExTextFieldIcon(
              tfController: tfController,
              icon: MdiIcons.diamondOutline,
              hint: hint,
            ).expand(),
            16.widthBox,
            IconButton(
              onPressed: () => onPressed.call(),
              icon: Icon(MdiIcons.arrowRightBold),
            ),
          ],
        ),
        if (helperText != null) helperText.text.caption(Get.context!).color(colorSuccess[600]!).make().pOnly(top: 8),
      ],
    );
  }
}
