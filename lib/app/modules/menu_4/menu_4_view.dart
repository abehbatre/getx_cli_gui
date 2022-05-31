import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pattern/app/resource/color.dart';
import 'package:getx_pattern/app/utils/decorator_helper.dart';
import 'package:getx_pattern/app/widgets/ex/index.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../widgets/ex/ex_button_outline.dart';
import 'item_menu.dart';
import 'menu_4_controller.dart';

class Menu4View extends GetView<Menu4Controller> {
  const Menu4View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => controller.isLoading.value == true ? LinearProgressIndicator() : 0.heightBox),
          HStack(
            [
              SizedBox(
                // color: Colors.pink,
                width: 200,
                height: 330,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.itemMenu.length,
                    itemBuilder: (context, index) {
                      return ItemMenu(
                        data: controller.itemMenu[index],
                        onItemClick: () => controller.itemMenuClick(index),
                      );
                    },
                  ),
                ),
              ),
              12.widthBox,
              Expanded(
                child: Obx(
                  () => buildContent(controller.selectedMenu.value),
                ),
              ),
            ],
          ).pSymmetric(h: 16, v: 8),
        ],
      ),
    );
  }

  Widget buildContent(int index) {
    if (index == 0) {
      return Container(
        height: 320,
        decoration: DecoratorHelper.commonBoxDecoration(fillColor: colorBlack, borderColor: colorBlack),
        child: VStack(
          [
            // 'Dart Path'.text.make().pOnly(bottom: 8),
            // Container(
            //   width: double.infinity,
            //   decoration: DecoratorHelper.commonBoxDecoration(borderColor: colorNeutralDark),
            //   child: '${whichSync('dart')}'.selectableText.maxLines(1).make().p8(),
            // ),
            // 12.heightBox,
            // 'GetX Path'.text.make().pOnly(bottom: 8),
            // Container(
            //   width: double.infinity,
            //   decoration: DecoratorHelper.commonBoxDecoration(borderColor: colorNeutralDark),
            //   child: '${whichSync('get')}'.selectableText.maxLines(1).make().p8(),
            // ),
            // 12.heightBox,
            // 'ADB Path'.text.make().pOnly(bottom: 8),
            // Container(
            //   width: double.infinity,
            //   decoration: DecoratorHelper.commonBoxDecoration(borderColor: colorNeutralDark),
            //   child: '${whichSync('adb')}'.selectableText.maxLines(1).make().p8(),
            // ),
            // 12.heightBox,
            // 'Firebase Path'.text.make().pOnly(bottom: 8),
            // Container(
            //   width: double.infinity,
            //   decoration: DecoratorHelper.commonBoxDecoration(borderColor: colorNeutralDark),
            //   child: '${whichSync('firebase')}'.selectableText.maxLines(1).make().p8(),
            // ),
            12.heightBox,
          ],
        ).p12().scrollVertical(),
      );
    } else {
      return Container(
        height: 320,
        decoration: DecoratorHelper.commonBoxDecoration(fillColor: colorBlack, borderColor: colorBlack),
        child: VStack(
          [
            HStack([
              Obx(
                () => '${controller.wTitle.value}'.text.caption(Get.context!).make(),
              ),
              Spacer(),
              ExButtonOutline(
                borderColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                isLabelBold: true,
                label: 'RUN',
                leftIcon: Icon(MdiIcons.codeArray, size: 20),
                labelColor: colorWhite,
                onPressed: () async => controller.runScript(index),
              ),
            ]),
            '${controller.shellOutput}'.selectableText.make().wh(double.infinity, 240),
          ],
        ).p12(),
      );
    }
  }
}
