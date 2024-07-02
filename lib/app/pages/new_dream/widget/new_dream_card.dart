import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key, required this.job, required this.description, required this.task, required this.progress});

  final String job;
  final String description;
  final int task;
  final int progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (progress > 0 && progress == task) ? DreamColors.mainColor : DreamColors.color4,
        gradient: (progress > 0 && progress != task)
            ? const LinearGradient(
                colors: [DreamColors.mainColor, DreamColors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(job, style: DreamTextTheme.medium16.copyWith(color: progress > 0 ? DreamColors.white : DreamColors.text2)),
                const SizedBox(height: 8),
                Text(description, style: DreamTextTheme.medium12.copyWith(color: progress > 0 ? DreamColors.white : DreamColors.mainColor)),
              ],
            ),
            task == progress
                ? Text(
                    "완료",
                    style: DreamTextTheme.medium14.copyWith(color: DreamColors.white),
                  )
                : progress > 0
                    ? Text("$progress/$task", style: DreamTextTheme.medium14.copyWith(color: DreamColors.mainColor))
                    : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
