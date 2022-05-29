import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/settings/settings.utils.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../resource/color.dart';
import '../../widgets/code_view/dart_code_viewer.dart';
import '../../widgets/ex/index.dart';
import 'menu_2_controller.dart';

class Menu2View extends GetView<Menu2Controller> {
  const Menu2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: Column(
        children: [
          Obx(() => controller.isLoading.value == true ? LinearProgressIndicator() : 0.heightBox),
          HStack(
            [
              VStack([
                'Input JSON'.text.caption(context).make().pOnly(bottom: 8),
                ExTextFieldMultiline(
                  tfController: controller.tfJson,
                  // fillColor: colorBlack,
                  maxLine: 23,
                ).w(200),
                16.heightBox,
              ]),
              12.widthBox,
              Expanded(
                child: VStack(
                  [
                    genSection(
                      tfController: controller.tfInput,
                      labelText: 'JSON to DART',
                      hint: 'ex: notification_list',
                      onPressed: () => controller.generate(),
                    ),
                    Divider(),
                    VStack(
                      [
                        'Output'.text.caption(context).make().pOnly(bottom: 8),
                        // ZStack([
                        //   Obx(
                        //     () => '${controller.shellOutput}'.selectableText.color(controller.shellOutputColor.value).make().p12().wh(double.infinity, 220).backgroundColor(Vx.black).cornerRadius(4),
                        //   ),
                        //   Align(
                        //     alignment: Alignment.topRight,
                        //     child: ExButtonOutline(
                        //       borderColor: Colors.transparent,
                        //       backgroundColor: Colors.transparent,
                        //       labelColor: colorErrorLight,
                        //       isLabelBold: true,
                        //       label: 'COPY',
                        //       height: 33,
                        //       onPressed: () => controller.copyOutputToClipboard(),
                        //     ).pOnly(right: 60),
                        //   ),
                        //   Align(
                        //     alignment: Alignment.topRight,
                        //     child: ExButtonOutline(
                        //       borderColor: Colors.transparent,
                        //       backgroundColor: Colors.transparent,
                        //       isLabelBold: true,
                        //       label: 'CLEAR',
                        //       height: 33,
                        //       onPressed: () => controller.shellOutput.value = '',
                        //     ),
                        //   ),
                        // ]),
                        ZStack(
                          [
                            1.heightBox,
                            Obx(
                              () => DartCodeViewer(
                                '${controller.shellOutput}',
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
                    ),
                  ],
                ),
              ),
            ],
            crossAlignment: CrossAxisAlignment.start,
          ).pSymmetric(h: 16, v: 16),
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
