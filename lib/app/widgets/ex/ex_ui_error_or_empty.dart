import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

import 'ex_button_outline.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_ui_error
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="156" alt="image" src="https://user-images.githubusercontent.com/36602270/169626815-4a6e631d-4ac6-4430-b2eb-5538ae12ac80.png">

class ExUiErrorOrEmpty extends StatelessWidget {
  const ExUiErrorOrEmpty({
    Key? key,
    required this.message,
    required this.callback,
    this.title = '',
    this.bgColor,
    this.textColor,
    this.btnText,
    this.svgAssets,
    this.showBtnRetry = false,
    this.textSize = 14,
    this.imageHeight,
    this.imageWidth,
  }) : super(key: key);

  final String message;
  final String title;
  final double? textSize;
  final String? btnText;
  final bool? showBtnRetry;
  final Color? bgColor;
  final Color? textColor;
  final VoidCallback callback;
  final String? svgAssets;
  final double? imageHeight;
  final double? imageWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // height: context.mq.size.height,
      // width: context.mq.size.width,
      child: Container(
        // height: context.mq.size.height,
        // width: context.mq.size.width,
        color: bgColor ?? Colors.transparent,
        child: VStack(
          [
            if (svgAssets != null)
              SvgPicture.asset(
                '$svgAssets',
                width: imageWidth,
                height: imageHeight,
              ).centered()
            else
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).errorColor,
              ).centered(),
            HeightBox(title.isEmptyOrNull ? 0 : 20),
            title.text.size(16).semiBold.color(Colors.black).makeCentered(),
            const HeightBox(20),
            if (message.isEmptyOrNull)
              'Terjadi Kesalahan'.text.size(textSize).color(textColor ?? Colors.black).makeCentered()
            else
              message.text.size(textSize).color(textColor ?? Colors.black).align(TextAlign.center).makeCentered(),
            const HeightBox(20),
            if (showBtnRetry == true)
              ExButtonOutline(
                label: btnText ?? 'Reload',
                labelColor: textColor ?? Colors.black,
                onPressed: callback,
              ).centered()
          ],
        ).centered(),
      ),
    );
  }
}
