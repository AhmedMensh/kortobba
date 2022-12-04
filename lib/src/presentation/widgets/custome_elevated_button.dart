import 'package:flutter/material.dart';
import 'package:kortoba_flutter_task/src/config/size_config/size_config.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final void Function() action;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elevation;
  final double? borderRadius;
  final double labelFontSize;
  final FontWeight fontWeight;

  const CustomButton({Key? key,
    required this.action,
    this.label,
    this.labelFontSize = 16,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
    this.fontWeight = FontWeight.w600,
    this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation ?? 0.5),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius ?? 6)))),
        backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor ?? Theme
                .of(context)
                .colorScheme
                .secondary),
        minimumSize: MaterialStateProperty.all<Size>(Size(
            SizeConfig.screenWidth! * 0.92, SizeConfig.screenHeight! * 0.06)),
      ),
      onPressed: action,
      child: Text(
        label ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: labelFontSize,
            color: textColor,
            fontWeight: fontWeight
        ),
      ),
    );
  }
}


class CustomRoundedButton extends StatelessWidget {
  final String? label;
  final void Function() action;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elevation;
  final double? topLeftBorderRadius, topRightBorderRadius,
      bottomLeftBorderRadius, bottomRightBorderRadius;
  final double labelFontSize;
  final FontWeight fontWeight;

  const CustomRoundedButton({Key? key,
    required this.action,
    this.label,
    this.labelFontSize = 16,
    this.topLeftBorderRadius,
    this.topRightBorderRadius,
    this.bottomLeftBorderRadius,
    this.bottomRightBorderRadius,
    this.backgroundColor,
    this.textColor,
    this.fontWeight = FontWeight.w600,
    this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation ?? 0.5),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(bottomLeftBorderRadius ?? 0),
                    bottomRight: Radius.circular(bottomRightBorderRadius ?? 0),
                    topLeft: Radius.circular(topLeftBorderRadius ?? 0),
                    topRight: Radius.circular(topRightBorderRadius ?? 0)))),
        backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor ?? Theme
                .of(context)
                .colorScheme
                .secondary),
        minimumSize: MaterialStateProperty.all<Size>(Size(
            SizeConfig.screenWidth! * 0.92, SizeConfig.screenHeight! * 0.06)),
      ),
      onPressed: action,
      child: Text(
        label ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: labelFontSize,
            color: textColor,
            fontWeight: fontWeight
        ),
      ),
    );
  }
}