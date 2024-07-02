import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  Widget bellAlarm({bool isAlarm = false}) {
    return Stack(
      children: [
        SvgPicture.asset("assets/icons/bell.svg"),
        if (isAlarm)
          Positioned(
            right: 0,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red, border: Border.all(color: Colors.white, width: 1)),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/splash.png",
          height: 20,
        ),
      ],
    );
  }
}
