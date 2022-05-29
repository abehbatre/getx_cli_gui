import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_pattern/app/modules/root_controller.dart';
import 'package:getx_pattern/app/resource/color.dart';
import 'package:getx_pattern/app/settings/settings.utils.dart';
import 'package:gredu_common/gredu_common.dart';
import 'package:velocity_x/velocity_x.dart';

import '../data/constans.dart';
import '../resource/theme.dart';

/// Sidekick top app bar
class SkAppBar extends GetView<RootController> implements PreferredSizeWidget {
  /// Constructor
  const SkAppBar({key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(45);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: platformBackgroundColor(context),
      title: Platform.isMacOS ? '$kAppTitle'.text.caption(context).make() : const SizedBox(height: 0, width: 0),
      centerTitle: true,
      actions: [
        '$packageVersion'.text.caption(context).makeCentered(),
        10.widthBox,
        Obx(
          () => IconButton(
            icon: Icon(
              Icons.radio_button_checked_sharp,
              color: controller.isLoading.value ? colorSuccess : colorWhite,
            ),
            iconSize: 20,
            splashRadius: 15,
            onPressed: () async {
              controller.isLoading.value = true;
              await AppSetting.checkRequirement(reCheck: true);
              controller.isLoading.value = false;
            },
          ),
        ),
        const SizedBox(width: 10),
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(
          height: 0,
          thickness: 0.5,
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }
}
