import 'package:dream/app/core/theme/color_theme.dart';
import 'package:flutter/material.dart';

abstract class DreamTextTheme {
  //Default Black
  //Name Rule
  //FontWeight + Color + Font Size

  static const extraBold22 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w800, fontSize: 22, color: DreamColors.mainColor);

  static const bold20 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w700, fontSize: 20, color: DreamColors.black);
  static const boldMain20 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w700, fontSize: 20, color: DreamColors.mainColor);

  static const boldGray18 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w700, fontSize: 18, color: DreamColors.grey);
  static const boldWhite14 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w700, fontSize: 14, color: DreamColors.white);
  static const boldGrey12 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w700, fontSize: 12, color: DreamColors.grey);

  static const regularGrey14 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w400, fontSize: 14, color: DreamColors.grey);
  static const regular20 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w400, fontSize: 20, color: DreamColors.black);
  static const regular12 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w400, fontSize: 12, color: DreamColors.black);
  static const regular10 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w400, fontSize: 10, color: DreamColors.black);
  static const regular9 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w400, fontSize: 9, color: DreamColors.black);
  static const regular14 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w400, fontSize: 14, color: DreamColors.black);
  static const regularWhite12 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w400, fontSize: 12, color: DreamColors.white);

  static const semiboldMain14 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w600, fontSize: 14, color: DreamColors.mainColor);
  static const semiboldMain20 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w600, fontSize: 20, color: DreamColors.mainColor);
  static const semiboldWhite22 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w600, fontSize: 22, color: DreamColors.white);
  static const semiboldGrey16 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w600, fontSize: 16, color: DreamColors.grey);
  static const semibold18 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w600, fontSize: 18, color: DreamColors.black);

  static const medium48 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w500, fontSize: 48, color: DreamColors.black);
  static const medium20 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w500, fontSize: 20, color: DreamColors.black);
  static const medium18 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w500, fontSize: 18, color: DreamColors.black);
  static const medium16 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w500, fontSize: 16, color: DreamColors.black);
  static const medium14 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w500, fontSize: 14, color: DreamColors.black);
  static const medium12 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w500, fontSize: 12, color: DreamColors.black);
  static const medium10 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w500, fontSize: 10, color: DreamColors.black);
  static const mediumGrey14 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w500, fontSize: 14, color: DreamColors.grey);
  static const mediumWhite14 = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w500, fontSize: 14, color: DreamColors.white);
}
