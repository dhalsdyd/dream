import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/core/theme/text_theme.dart';
import 'package:dream/app/pages/community/widget/community_card.dart';
import 'package:dream/app/pages/community/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/sun.svg"),
                        const SizedBox(width: 2),
                        Text(
                          "꿈꾸는 드리머들의 선택",
                          style: DreamTextTheme.semibold18.copyWith(color: DreamColors.text1),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 8);
                        },
                        itemBuilder: (context, index) {
                          return const BestDreamCard();
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    const WriteCard(),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/achieve.svg"),
                        const SizedBox(width: 8),
                        SvgPicture.asset("assets/images/question.svg"),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const AchieveCard();
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 16),
                        itemCount: 5)
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
