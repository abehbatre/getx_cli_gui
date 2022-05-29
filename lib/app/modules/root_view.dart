import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/modules/menu_1/menu_1_view.dart';
import 'package:getx_pattern/app/modules/menu_2/menu_2_view.dart';
import 'package:getx_pattern/app/modules/menu_4/menu_4_view.dart';
import 'package:getx_pattern/app/modules/root_controller.dart';
import 'package:getx_pattern/app/resource/color.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../data/constans.dart';
import '../resource/theme.dart';
import '../utils/layout_size.dart';
import '../widgets/ex/index.dart';
import '../widgets/top_app_bar.dart';
import 'menu_3/menu_3_view.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LayoutSize.init(context);
    return Scaffold(
      backgroundColor: platformBackgroundColor(context),
      appBar: const SkAppBar(),
      body: HStack(
        [
          // drawer menu
          Obx(
            () => NavigationRail(
              selectedIndex: controller.selectedIndex.value,
              backgroundColor: platformBackgroundColor(context),
              minWidth: kNavigationWidth,
              minExtendedWidth: kNavigationWidthExtended,
              extended: !LayoutSize.isSmall,
              onDestinationSelected: (index) => controller.onNavigationChange(index),
              destinations: [
                renderNavButton(context, 'Gen Module', MdiIcons.mathCompass),
                renderNavButton(context, 'JSON to Dart', MdiIcons.api),
                renderNavButton(context, 'Gen Template', MdiIcons.codeBraces),
                renderNavButton(context, 'Toolbox', MdiIcons.application),
              ],
            ),
          ),
          VerticalDivider(thickness: 1, width: 1),

          // content
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Scaffold(body: HStack([Expanded(child: renderContent())]))
              ],
            ),
          ),
        ],
      ),

      // footer
      bottomNavigationBar: Container(
        color: Colors.black,
        child: HStack(
          [
            Obx(
              () => '${controller.footerText}'.text.caption(context).make(),
            ),
            Spacer(),
            'Created with 💦 by $kAuthor'.text.caption(context).align(TextAlign.center).make(),
          ],
        ).pSymmetric(h: 16, v: 5),
      ),
    );
  }

  // base content
  Scaffold renderContent() {
    return Scaffold(
      appBar: ExHeader(
        title: Obx(
          () => '${controller.title}'
              .richText
              .withTextSpanChildren([
                ' | '.textSpan.blueGray400.make(),
                '${controller.titlePrefix}'.textSpan.color(colorSuccess[400]!).bold.make(),
              ])
              .maxLines(1)
              .make(),
        ),
        subTitle: Obx(
          () => '${controller.subtitle}'
              .richText
              .withTextSpanChildren([
                '${controller.selectedPath}'.textSpan.blue400.make(),
              ])
              .maxLines(1)
              .size(12)
              .coolGray300
              .make(),
        ),
        actions: [
          ExButtonOutline(
            label: 'Select Path to Your Project',
            height: 36,
            // backgroundColor: Colors.transparent,
            borderColor: colorNeutralDark,
            onPressed: () => controller.dialogSelectPath(),
          ),
          1.widthBox,
        ],
      ),
      body: Obx(() => renderPage(controller.selectedIndex.value)),
    );
  }

// Render corret page widget based on index
  Widget renderPage(int index) {
    final pages = [
      Menu1View(),
      Menu2View(),
      Menu3View(),
      Menu4View(),
    ];
    return pages[index];
  }

  NavigationRailDestination renderNavButton(BuildContext context, String label, IconData iconData) {
    return NavigationRailDestination(
      icon: Icon(iconData, size: 20),
      selectedIcon: Icon(iconData, size: 20, color: Theme.of(context).colorScheme.secondary),
      label: Text(label),
    );
  }
}
