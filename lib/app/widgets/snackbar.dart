import 'package:dream/app/core/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DreamSnackBar {
  static void open(
    String title, {
    Color backgroundColor = DreamColors.mainColor,
    Color textColor = Colors.white,
  }) {
    Get.rawSnackbar(
      titleText: Text(title, style: TextStyle(fontFamily: 'Pretendard', fontWeight: FontWeight.w500, fontSize: 16, height: 1, color: textColor)),
      messageText: Container(),
      backgroundColor: backgroundColor,
      borderRadius: 12,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      animationDuration: const Duration(milliseconds: 800),
    );
  }
}

class DreamErrorSnackBar {
  void open(String title, {String? message}) {
    DreamSnackBar.open(
      title,
      backgroundColor: DreamColors.grey,
      textColor: Colors.white,
    );
  }
}
