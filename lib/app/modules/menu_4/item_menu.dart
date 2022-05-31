import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_pattern/app/modules/menu_4/menu_4_controller.dart';
import 'package:getx_pattern/app/resource/color.dart';
import 'package:gredu_common/gredu_common.dart';

import '../../utils/decorator_helper.dart';

class ItemModel {
  ItemModel({required this.title, required this.icon, this.isSelected});

  String title;
  Widget icon;
  bool? isSelected;
}

class ItemMenu extends GetView<Menu4Controller> {
  const ItemMenu({
    required this.data,
    required this.onItemClick,
    Key? key,
  }) : super(key: key);

  final ItemModel data;
  final Function onItemClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: DecoratorHelper.commonBoxDecoration(
        borderColor: Colors.transparent,
        fillColor: data.isSelected == true ? colorNeutralDark : Color(0xff2B2D2F),
        borderRadius: 32,
      ),
      child: HStack([
        if (data.icon != null) data.icon.pOnly(right: 12),

        '${data.title}'.text.bold.make(),
        // '${data.description}'.text.caption(context).make(),
      ]).p8().pOnly(left: 16),
    ).pSymmetric(v: 6).onTap(() => onItemClick.call());
  }
}
