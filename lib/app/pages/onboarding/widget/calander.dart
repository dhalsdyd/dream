import 'dart:developer';

import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/core/theme/text_theme.dart';
import 'package:dream/app/data/models/schedule.dart';
import 'package:dream/app/pages/calander/controller.dart';
import 'package:dream/app/pages/calander/widget/add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Range {
  final DateTime? start;
  final DateTime? end;

  int? startDay;
  int? endDay;

  Range({this.start, this.end, this.startDay = 0, this.endDay = 0}) {
    if (start != null && end != null) {
      startDay = start!.day;
      endDay = end!.day;
    }
  }

  bool isInclude(int data) {
    return data >= startDay! && data <= endDay!;
  }

  bool isIncludeRange(Range data) {
    return isInclude(data.startDay!) || isInclude(data.endDay!);
  }
}

class CalendarViewer extends StatelessWidget {
  final DateTime now;
  final List<Schedule> scheduleList;

  const CalendarViewer({Key? key, required this.now, required this.scheduleList}) : super(key: key);

  double get width => ((Get.width) - 16) / 8;

  List<Widget> calcDate() {
    List<Widget> dates = [];

    final startDay = DateTime(now.year, now.month, 1);
    final prevMonthLastDay = DateTime(now.year, now.month, 0).day; // 지난달의 마지막 날짜
    final prevDay = startDay.weekday % 7; // 일요일을 0으로 맞춤

    final endDay = DateTime(now.year, now.month + 1, 0);
    final nextDate = endDay.day;
    final nextDay = endDay.weekday % 7; // 일요일을 0으로 맞춤

    // 지난달
    for (int i = prevMonthLastDay - prevDay + 1; i <= prevMonthLastDay; i++) {
      int weekday = (startDay.weekday - prevDay + (i - (prevMonthLastDay - prevDay))) % 7;
      bool isSaturday = weekday == 0;
      bool isSunday = weekday == 1;

      dates.add(
        CalendarViewerDateItem(
          date: i,
          lastday: true,
          isHighlighted: false,
          isSaturday: isSaturday,
          isSunday: isSunday,
        ),
      );
    }

    // 이번달
    for (int i = 1; i <= nextDate; i++) {
      int weekday = (i + startDay.weekday - 1) % 7;
      bool isSaturday = weekday == 6;
      bool isSunday = weekday == 0;

      if (i == now.day) {
        dates.add(
          CalendarViewerDateItem(
            date: i,
            isHighlighted: true,
            isSaturday: isSaturday,
            isSunday: isSunday,
          ),
        );
      } else {
        dates.add(
          CalendarViewerDateItem(
            date: i,
            isHighlighted: false,
            isSaturday: isSaturday,
            isSunday: isSunday,
          ),
        );
      }
    }

    // 다음달
    for (int i = 1; i <= (6 - nextDay); i++) {
      int weekday = (i + nextDay) % 7;
      bool isSaturday = weekday == 6;
      bool isSunday = weekday == 0;

      dates.add(
        CalendarViewerDateItem(
          date: i,
          lastday2: true,
          isHighlighted: false,
          isSaturday: isSaturday,
          isSunday: isSunday,
        ),
      );
    }

    return dates;
  }

  List<Range> calcRange() {
    List<Range> ranges = [];
    for (int i = 0; i < scheduleList.length; i++) {
      ranges.add(Range(start: scheduleList[i].startingAt, end: scheduleList[i].endingAt));
    }
    return ranges;
  }

  @override
  Widget build(BuildContext context) {
    final weekdays = ['일', '월', '화', '수', '목', '금', '토'];
    List<Widget> dates = calcDate();

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${now.year}년 ${now.month}월", style: DreamTextTheme.semiboldMain20.copyWith(color: DreamColors.mainColor)),
                Row(children: [
                  RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(
                        "assets/icons/right.svg",
                        color: DreamColors.color6,
                      )),
                  SvgPicture.asset("assets/icons/right.svg"),
                ]),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: weekdays
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(0),
                          child: SizedBox(
                            width: width,
                            child: Text(
                              e,
                              style: DreamTextTheme.regular14.copyWith(color: DreamColors.color5),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 8),
              Column(children: [
                for (int i = 0; i < dates.length; i += 7)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: dates.sublist(i, i + 7),
                      ),
                      // TimeLine(
                      //     range: Range(startDay: i, endDay: i + 7), ranges: []),
                    ],
                  )
              ]),
            ],
          )
        ],
      ),
    );
  }
}

class TimeLine extends StatelessWidget {
  final Range range;
  final List<Range> ranges;

  const TimeLine({Key? key, required this.range, required this.ranges}) : super(key: key);

  // Seven equal portion of the screen Width
  double get width => ((Get.width) - 32) / 7;

  @override
  Widget build(BuildContext context) {
    List<bool> temp = [false, true, true, true, false, false, false];
    return Row(
      children: [
        for (int i = range.startDay!; i <= range.endDay!; i++)
          TimeLineItem(
            width: width,
            isHighlighted: temp[i],
          ),
      ],
    );
  }
}

class TimeLineItem extends StatelessWidget {
  final double width;
  final bool start, end;
  final bool isHighlighted;

  const TimeLineItem({Key? key, required this.width, this.isHighlighted = false, this.start = false, this.end = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(start ? 5 : 0), topRight: Radius.circular(end ? 5 : 0)),
        color: isHighlighted ? DreamColors.mainColor : Colors.transparent,
      ),
    );
  }
}

class CalendarViewerDateItem extends StatelessWidget {
  final int date;
  final bool lastday;
  final bool lastday2;
  final bool isHighlighted;
  final bool isSaturday;
  final bool isSunday;

  const CalendarViewerDateItem({
    required this.date,
    this.lastday = false,
    this.lastday2 = false,
    this.isHighlighted = false,
    this.isSaturday = false,
    this.isSunday = false,
    Key? key,
  }) : super(key: key);

  double get width => ((Get.width) - 16) / 8;

  TextStyle get _textStyle {
    if (lastday || lastday2) {
      if (isSaturday) {
        return DreamTextTheme.regular14.copyWith(color: DreamColors.key.withOpacity(0.4));
      } else if (isSunday) {
        return DreamTextTheme.regular14.copyWith(color: DreamColors.color7.withOpacity(0.4));
      } else {
        return DreamTextTheme.regular14.copyWith(color: DreamColors.black.withOpacity(0.4));
      }
    } else if (isSaturday) {
      return DreamTextTheme.regular14.copyWith(color: DreamColors.key);
    } else if (isSunday) {
      return DreamTextTheme.regular14.copyWith(color: DreamColors.color7);
    } else {
      return DreamTextTheme.regular14.copyWith(color: DreamColors.black);
    }
  }

  List<Widget> _buildEvents() {
    List<Widget> events = [];
    DateTime selectedDate = currentDate();
    CalanderPageController.to.events.value[selectedDate]?.forEach((element) {
      events.add(_event(element[0], element[1]));
    });
    return events;
  }

  DateTime currentDate() {
    int year = DateTime.now().year;
    int month = DateTime.now().month;
    int day = date;

    if (lastday) {
      month -= 1;
      if (month == 0) {
        month = 12;
        year -= 1;
      }
    }
    if (lastday2) {
      month += 1;
      if (month == 13) {
        month = 1;
        year += 1;
      }
    }

    DateTime selectedDate = DateTime(year, month, day);
    return selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime selectedDate = currentDate();
        int weekday = selectedDate.weekday;

        String month = selectedDate.month.toString();
        String day = selectedDate.day.toString();
        String dayOfWeek = "";

        switch (weekday) {
          case 1:
            dayOfWeek = "월";
            break;
          case 2:
            dayOfWeek = "화";
            break;
          case 3:
            dayOfWeek = "수";
            break;
          case 4:
            dayOfWeek = "목";
            break;
          case 5:
            dayOfWeek = "금";
            break;
          case 6:
            dayOfWeek = "토";
            break;
          case 7:
            dayOfWeek = "일";
            break;
        }
        CalanderPageController.to.selectedDate.value = selectedDate;
      },
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 100),
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                color: CalanderPageController.to.isSelectedDate(currentDate()) ? DreamColors.mainColor.withOpacity(0.1) : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
              ),
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      date.toString(),
                      style: _textStyle, //isHighlighted ? Colors.white : Colors.black
                      textAlign: TextAlign.center,
                    ),
                    ..._buildEvents(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _event(String text, DreamColorChips color) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: color.backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: DreamTextTheme.regular9.copyWith(color: color.color),
        ),
      ),
    );
  }
}
