import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'loading_animation/loading_animation_widget.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_ui_loading
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="122" alt="image" src="https://user-images.githubusercontent.com/36602270/169626852-b050bc69-e3a2-422f-b3ff-0e7644597526.png">

class ExUiLoading extends StatelessWidget {
  const ExUiLoading({
    Key? key,
    this.message,
    this.pbColor,
    this.pbSize,
  }) : super(key: key);

  final String? message;
  final Color? pbColor;
  final double? pbSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: context.mq.size.height,
      width: context.mq.size.width,
      child: Center(
        child: VStack(
          [
            LoadingAnimationWidget.discreteCircle(
              color: Theme.of(context).primaryColor,
              size: 32,
            ).centered(),
            30.heightBox,
            (message ?? 'Sedang mengambil data...').text.size(11).makeCentered(),
          ],
        ),
      ),
    );
  }
}
