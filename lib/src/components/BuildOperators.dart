import 'dart:ffi';
import 'dart:io';

import 'package:basic_calculator/src/utils/AppColors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Buildoperators extends StatelessWidget {
  final String operator;
  final IconData? icon;
  final double fontSize;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const Buildoperators({
    super.key,
    required this.operator,
    this.icon,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w400,
    this.backgroundColor = AppColors.buttonLight,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: getBorderRadius(),
      child: InkWell(
        highlightColor: backgroundColor,
        mouseCursor: MouseCursor.uncontrolled,
        borderRadius: getBorderRadius(),
        onTap: onTap,
        onLongPress: onLongPress,
        child: Container(
          width: getWidth(),
          height: getHeight(),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: getBorderRadius(),
          ),
          child: icon != null
              ? Icon(
                  icon,
                  size: (Platform.isIOS || Platform.isAndroid) ? 16 * 2 : 16,
                  color: AppColors.textWhite,
                )
              : Text(
                  operator,
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontSize: (Platform.isIOS || Platform.isAndroid)
                        ? fontSize * 2
                        : fontSize,
                    fontWeight: fontWeight,
                  ),
                ),
        ),
      ),
    );
  }

  double getWidth() {
    if (kIsWeb) {
      return 40;
    } else if (Platform.isIOS) {
      return 90;
    } else if (Platform.isAndroid) {
      return 90;
    } else if (Platform.isMacOS) {
      return 40;
    } else {
      // Fallback
      return 40;
    }
  }

  double getHeight() {
    if (kIsWeb) {
      return 40;
    } else if (Platform.isIOS) {
      return 90;
    } else if (Platform.isAndroid) {
      return 90;
    } else if (Platform.isMacOS) {
      return 40;
    } else {
      // Fallback
      return 40;
    }
  }

  BorderRadius getBorderRadius() {
    if (kIsWeb) {
      return BorderRadius.circular(10);
    } else if (Platform.isIOS) {
      return BorderRadius.circular(45);
    } else if (Platform.isAndroid) {
      return BorderRadius.circular(45);
    } else if (Platform.isMacOS) {
      return BorderRadius.circular(20);
    } else {
      // Fallback
      return BorderRadius.circular(8);
    }
  }
}
