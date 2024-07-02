import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/core/theme/text_theme.dart';
import 'package:dream/app/pages/onboarding/widget/calander.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key, required this.job, required this.description, required this.selected});

  final String job;
  final String description;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? DreamColors.mainColor : DreamColors.color4,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(job, style: DreamTextTheme.medium16.copyWith(color: selected ? DreamColors.white : DreamColors.text2)),
                const SizedBox(height: 8),
                Text(description, style: DreamTextTheme.medium12.copyWith(color: selected ? DreamColors.white : DreamColors.mainColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RecommandCard extends StatelessWidget {
  const RecommandCard({super.key, required this.work, required this.selected});

  final String work;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? DreamColors.mainColor : DreamColors.color4,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(work, style: DreamTextTheme.medium16.copyWith(color: selected ? DreamColors.white : DreamColors.text2)),
          ],
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    super.key,
    required this.work,
    required this.range,
  });

  final String work;
  final String range;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: ExpansionPanelList.radio(
        elevation: 0,
        children: [
          ExpansionPanelRadio(
              backgroundColor: DreamColors.color4,
              value: work,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  decoration: BoxDecoration(
                    color: DreamColors.color4,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(work, style: DreamTextTheme.medium16.copyWith(color: DreamColors.text1)),
                            const SizedBox(height: 8),
                            Row(children: [
                              SvgPicture.asset("assets/icons/uil_calender.svg"),
                              const SizedBox(width: 4),
                              Text(range, style: DreamTextTheme.medium12.copyWith(color: DreamColors.color5)),
                            ])
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              body: CalendarViewer(
                now: DateTime.now(),
                scheduleList: [],
              )),
        ],
      ),
    );
  }
}
