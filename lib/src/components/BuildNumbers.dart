import 'dart:io';

import 'package:basic_calculator/src/utils/AppColors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Buildnumbers extends StatelessWidget {
  final String number;
  final VoidCallback? onTap;

  const Buildnumbers({
    super.key,
    required this.number,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.buttonDark,
      borderRadius: getBorderRadius(),
      child: InkWell(
        onTap: onTap,
        borderRadius: getBorderRadius(),
        child: Container(
          width: getWidth(),
          height: getHeight(),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: getBorderRadius(),
          ),
          child: Text(
            number,
            style: TextStyle(
              color: AppColors.textWhite,
              fontSize: (Platform.isIOS || Platform.isAndroid) ? 32 : 16,
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
