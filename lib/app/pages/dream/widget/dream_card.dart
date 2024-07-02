import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DreamyCard extends StatelessWidget {
  const DreamyCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: const Color(0xff3300FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.challenge, required this.todo, this.colorChip = DreamColorChips.dream});

  final String challenge;
  final String todo;
  final DreamColorChips colorChip;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: colorChip.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                challenge,
                style: DreamTextTheme.medium10.copyWith(color: colorChip.color),
              ),
              const SizedBox(height: 4),
              Text(todo, style: DreamTextTheme.medium14)
            ],
          ),
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              border: Border.all(color: colorChip.color),
              borderRadius: BorderRadius.circular(4),
            ),
          )
        ],
      ),
    );
  }
}

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({super.key, required this.challenge, required this.range});

  final String challenge;
  final String range;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        color: DreamColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(challenge, style: DreamTextTheme.semibold18.copyWith(color: DreamColors.mainColor)),
                  const SizedBox(width: 4),
                  SvgPicture.asset("assets/icons/right.svg")
                ],
              ),
              const SizedBox(height: 8),
              Text(range, style: DreamTextTheme.medium12.copyWith(color: DreamColors.color5)),
            ],
          ),
          Text("D-10", style: DreamTextTheme.medium16.copyWith(color: DreamColors.mainColor)),
        ],
      ),
    );
  }
}
