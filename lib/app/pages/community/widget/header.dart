import 'package:dream/app/core/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  Widget bellAlarm({bool isAlarm = false}) {
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/icons/bell.svg",
          color: DreamColors.black,
        ),
        if (isAlarm)
          Positioned(
            right: 1,
            top: 1,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xffFF3D66), border: Border.all(color: Colors.white, width: 1)),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/splash_blue.png",
          height: 20,
        ),
        Row(
          children: [
            SvgPicture.asset("assets/icons/search.svg"),
            const SizedBox(width: 16),
            bellAlarm(isAlarm: true),
          ],
        )
      ],
    );
  }
}
