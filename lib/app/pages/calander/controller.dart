import 'dart:developer';

import 'package:dream/app/core/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalanderPageController extends GetxController with StateMixin {
  static CalanderPageController get to => Get.find<CalanderPageController>(); // add this line

  final Rx<Map<DateTime, List>> events = Rx({});
  Rx<DateTime?> selectedDate = Rx(null);
  bool isSelectedDate(DateTime date) => selectedDate.value == date;

  Rx<String> categoryName = Rx("");
  Rx<DreamColorChips> categoryColor = Rx(DreamColorChips.green);

  void setCategory(String name, DreamColorChips colorChips) {
    categoryName.value = name;
    categoryColor.value = colorChips;
    log("categoryName: ${categoryName.value} categoryColor: ${categoryColor.value}");
  }

  bool get isCategorySelected => categoryName.value.isNotEmpty && categoryColor.value != Colors.white;

  final TextEditingController titleController = TextEditingController();

  void addEvent(DateTime date, String title, DreamColorChips color) {
    if (events.value[date] == null) {
      events.value[date] = [];
    }
    events.value[date]!.add([title, color]);
    events.refresh();
    log(events.value.toString());
  }

  void onEditingComplete() {
    log("onEditingComplete");

    String title = titleController.text;
    DreamColorChips color = categoryColor.value;
    titleController.clear();

    if (title.isEmpty) {
      Get.snackbar("알림", "일정을 입력해주세요");
      return;
    }

    addEvent(selectedDate.value!, title, color);

    log("events: ${events.value}");
    Get.back();
  }
}
