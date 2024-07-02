import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/core/theme/text_theme.dart';
import 'package:dream/app/pages/dream/widget/dream_card.dart';
import 'package:dream/app/pages/dream/widget/header.dart';
import 'package:dream/app/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DreamPage extends StatelessWidget {
  const DreamPage({Key? key}) : super(key: key);

  final String userName = "Dreamy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DreamColors.mainColor,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Header(),
                const SizedBox(height: 16),
                DreamyCard(
                    child: Row(
                  children: [
                    Image.asset(
                      "assets/images/dreamroom.png",
                      height: 40,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$userName님,",
                          style: const TextStyle(color: DreamColors.white),
                        ),
                        const Text(
                          "오늘은 어떤 꿈을 꾸었나요?",
                          style: TextStyle(color: DreamColors.white),
                        )
                      ],
                    ),
                  ],
                )),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.new_dream);
                  },
                  child: DreamyCard(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: DreamColors.mainColor,
                            ),
                            child: const Icon(Icons.add, color: DreamColors.color3),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "꿈을 입력해주세요",
                            style: TextStyle(color: DreamColors.color3),
                          )
                        ],
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.6,
              maxChildSize: 0.92,
              snap: true,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffFAFAFA),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PromotionText(day: "3", challenge: "포토샵 1주일 마스터"),
                            SizedBox(height: 16),
                            TodoCard(challenge: "포토샵 1주일 마스터", todo: "3강 수강"),
                            SizedBox(height: 8),
                            TodoCard(challenge: "HTML 기초 정복", todo: "2강 수강"),
                            SizedBox(height: 32),
                            Text("도전중인 Dream!", style: DreamTextTheme.bold20),
                            SizedBox(height: 16),
                            ChallengeCard(challenge: "포토샵 1주일 마스터", range: "2024년 6월 28일 ~ 2024년 7월 5일"),
                            SizedBox(height: 8),
                            ChallengeCard(challenge: "HTML 기초 정복", range: "2024년 6월 28일 ~ 2024년 7월 5일"),
                            SizedBox(height: 8),
                            ChallengeCard(challenge: "승마 주말 체험반", range: "2024년 6월 28일 ~ 2024년 7월 5일"),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      )),
    );
  }
}

class PromotionText extends StatelessWidget {
  const PromotionText({
    super.key,
    required this.day,
    required this.challenge,
  });

  final String day;
  final String challenge;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String dayweek = now.weekday == 1
        ? "월"
        : now.weekday == 2
            ? "화"
            : now.weekday == 3
                ? "수"
                : now.weekday == 4
                    ? "목"
                    : now.weekday == 5
                        ? "금"
                        : now.weekday == 6
                            ? "토"
                            : "일";

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // PROMOTION
      Row(
        children: [
          const Text("🔥", style: DreamTextTheme.medium16),
          Text(day, style: DreamTextTheme.medium16.copyWith(color: DreamColors.mainColor)),
          const Text("일 째 ", style: DreamTextTheme.medium16),
          Text(challenge, style: DreamTextTheme.medium16.copyWith(color: DreamColors.mainColor)),
          const Text(" 도전 중", style: DreamTextTheme.medium16),
        ],
      ),
      const SizedBox(height: 8),
      // 오늘 몇월 몇일 몇요일
      Text("오늘 ${now.month}월 ${now.day}일 $dayweek요일", style: DreamTextTheme.bold20),
    ]);
  }
}
