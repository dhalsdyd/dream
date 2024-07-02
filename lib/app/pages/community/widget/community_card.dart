import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BestDreamCard extends StatelessWidget {
  const BestDreamCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 200,
          decoration: const BoxDecoration(
            color: DreamColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: Image.asset("assets/stickers/sticker_5.png"),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("꿈꾸는 드리머", style: DreamTextTheme.medium14.copyWith(color: DreamColors.text1)),
                        Text("2024년 6월 30일", style: DreamTextTheme.medium10.copyWith(color: DreamColors.color5)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("20살에 카카오 UIUX 팀장이", style: DreamTextTheme.medium14.copyWith(color: DreamColors.text2)),
                    Text("될 수 있었던 이유", style: DreamTextTheme.medium14.copyWith(color: DreamColors.text2)),
                  ],
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("#UIUX_8주_취업반", style: DreamTextTheme.regular12.copyWith(color: DreamColors.mainColor)),
                    Text("수강완료까지 60일 걸렸어요", style: DreamTextTheme.regular12.copyWith(color: DreamColors.mainColor)),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 200,
          decoration: const BoxDecoration(
              color: DreamColors.color4,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              )),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              SvgPicture.asset("assets/icons/eye.svg"),
              const SizedBox(width: 4),
              Text("42,452", style: DreamTextTheme.regular10.copyWith(color: DreamColors.mainColor)),
              const SizedBox(width: 4),
              SvgPicture.asset("assets/icons/heart.svg"),
              const SizedBox(width: 4),
              Text("3,523", style: DreamTextTheme.regular10.copyWith(color: DreamColors.mainColor)),
            ]),
          ),
        )
      ],
    );
  }
}

class WriteCard extends StatelessWidget {
  const WriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff0047FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset("assets/stickers/sticker_6.png"),
                    ),
                    const SizedBox(width: 8),
                    Text("Dreamy님! 이야기를 공유해주세요", style: DreamTextTheme.medium16.copyWith(color: DreamColors.white))
                  ],
                ),
                Row(
                  children: [
                    Text("글쓰기", style: DreamTextTheme.regular12.copyWith(color: DreamColors.white)),
                    SvgPicture.asset(
                      "assets/icons/right.svg",
                      width: 12,
                      color: DreamColors.white,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AchieveCard extends StatelessWidget {
  const AchieveCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DreamColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: Image.asset("assets/stickers/sticker_4.png"),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("참새 쨱쨱", style: DreamTextTheme.medium14.copyWith(color: DreamColors.text1)),
                        Text("2024년 7월 3일", style: DreamTextTheme.medium10.copyWith(color: DreamColors.color5)),
                      ],
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  SvgPicture.asset("assets/icons/eye.svg"),
                  const SizedBox(width: 4),
                  Text("42,452", style: DreamTextTheme.regular10.copyWith(color: DreamColors.mainColor)),
                  const SizedBox(width: 4),
                  SvgPicture.asset("assets/icons/heart.svg"),
                  const SizedBox(width: 4),
                  Text("3,523", style: DreamTextTheme.regular10.copyWith(color: DreamColors.mainColor)),
                ]),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "[비전공자] 6개월 승무원 취업기",
              style: DreamTextTheme.medium16.copyWith(color: DreamColors.text1),
            ),
            const SizedBox(height: 8),
            Text(
              "안녕하세요 :) 저는 인서울대학 컴퓨터공학과를 졸업한 26세입니다. 공대 중에서도 가장 취업률이 높다는 컴공과에 왔는데, 적성에 안 맞는 과여서 졸업도 우여곡절 끝에 하게 되었습니다.",
              style: DreamTextTheme.regular12.copyWith(color: DreamColors.text1),
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("#비전공자용_승무원_취업반", style: DreamTextTheme.regular12.copyWith(color: DreamColors.mainColor)),
                Text("#수강완료까지 180일 걸렸어요", style: DreamTextTheme.regular12.copyWith(color: DreamColors.mainColor)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
