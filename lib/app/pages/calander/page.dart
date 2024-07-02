import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/core/theme/text_theme.dart';
import 'package:dream/app/pages/calander/widget/add.dart';
import 'package:dream/app/pages/calander/widget/calander.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CalanderPage extends StatelessWidget {
  CalanderPage({Key? key}) : super(key: key);

  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: DreamColors.white,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${now.year}년 ${now.month}월", style: DreamTextTheme.semiboldMain20.copyWith(color: DreamColors.mainColor)),
                    GestureDetector(
                      child: SvgPicture.asset("assets/icons/sticker.svg"),
                      onTap: () {
                        SelectModal().showSticker();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CalendarViewer(now: DateTime.now(), scheduleList: const []),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
