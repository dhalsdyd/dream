import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: DreamColors.mainColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(44),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hello World!!!", style: DreamTextTheme.bold20),
          ],
        ),
      )),
    );
  }
}
