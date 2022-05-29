import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../blur_background.dart';

class ExHeader extends StatelessWidget implements PreferredSizeWidget {
  const ExHeader({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.actions,
  }) : super(key: key);

  final Widget title;
  final Widget? subTitle;
  final List<Widget> actions;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Stack(
        children: [
          const BlurBackground(),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 59,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    VStack(
                      [
                        title,
                        2.heightBox,
                        if (subTitle != null) subTitle!,
                      ],
                    ).expand(),
                    12.widthBox,
                    ...actions,
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
