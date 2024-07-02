// ignore_for_file: non_constant_identifier_names

import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/core/util/holland.dart';
import 'package:dream/app/pages/calander/controller.dart';
import 'package:dream/app/routes/route.dart';
import 'package:get/get.dart';

class OnboardingPageController extends GetxController with StateMixin {
  static OnboardingPageController get to => Get.find<OnboardingPageController>(); // add this line

  final sequence = 1.obs;

  // First Sequence
  final firstHollandCode = "".obs;
  final secondHollandCode = "".obs;

  void setHollandCode(Holland code) {
    if (firstHollandCode.value.isEmpty) {
      firstHollandCode.value = code.code;
    } else if (firstHollandCode.value != code.code) {
      secondHollandCode.value = code.code;
    } else if (firstHollandCode.value == code.code) {
      firstHollandCode.value = "";
      secondHollandCode.value = "";
    }
  }

  bool selectedfirstCode(Holland code) => firstHollandCode.value == code.code;
  bool selectedSecondCode(Holland code) => secondHollandCode.value == code.code;
  bool get isHollandCodeSelected => firstHollandCode.value.isNotEmpty && secondHollandCode.value.isNotEmpty;

  // Second Sequence
  final Rx<int?> selectedJob = Rx(null);
  final job_list = [
    ["광고/홍보/마케팅 전문가", "서로 다른 나라의 언어를 번역하는 일을 해요"],
    ["마케팅/광고/홍보 관리자", "서로 다른 나라의 언어를 번역하는 일을 해요"],
    ["상품 기획자", "서로 다른 나라의 언어를 번역하는 일을 해요"],
    ["예술/디자인/방송 관리자", "서로 다른 나라의 언어를 번역하는 일을 해요"],
    ["웹 기획자", "서로 다른 나라의 언어를 번역하는 일을 해요"],
    ["퍼스널 쇼퍼", "서로 다른 나라의 언어를 번역하는 일을 해요"],
    ["행사 기획자", "서로 다른 나라의 언어를 번역하는 일을 해요"],
  ];

  void setJob(index) {
    if (selectedJob.value == index) {
      selectedJob.value = null;
      return;
    }
    selectedJob.value = index;
  }

  bool isSelectedJob(int index) => selectedJob.value == index;
  bool get isJobSelected => selectedJob.value != null;

  // Third Sequence
  final Rx<int?> selectWork = Rx(null);
  final recommand_list = ["포토샵 1주일 마스터", "PT 실력 강화", "기획안 쓰는 방법", "Meta 마케팅 하는 방법"];

  void setWork(index) {
    if (selectWork.value == index) {
      selectWork.value = null;
      return;
    }
    selectWork.value = index;
  }

  bool isSelectedWork(int index) => selectWork.value == index;
  bool get isWorkSelected => selectWork.value != null;

  // Fourth Sequence
  final curriculum_list = ["포토샵 설치", "포토샵 기초 동영상 시청", "펜툴 마스터", "작품 만들어보기"];
  final Rx<List<int>> selectCurriculum = Rx([]);

  void setCurriculum(index) {
    if (selectCurriculum.value.contains(index)) {
      selectCurriculum.value.remove(index);
      selectCurriculum.refresh();
      return;
    }
    selectCurriculum.value.add(index);
    selectCurriculum.refresh();
  }

  void setAll() {
    selectCurriculum.value = [0, 1, 2, 3];
    selectCurriculum.refresh();
  }

  bool isSelectedCurriculum(int index) => selectCurriculum.value.contains(index);
  bool get isCurriculumSelected => selectCurriculum.value.isNotEmpty;

  // Fifth Sequence
  final Rx<List> selectCurriculumTime = Rx([]);
  final Rx<List> selectCurriculumTime2 = Rx([]);

  // Next sequence
  void next() {
    sequence.value++;
    if (sequence.value == 4) {
      setAll();
    }

    if (sequence.value == 5) {
      selectCurriculum.value.forEach((element) {
        selectCurriculumTime.value.add([curriculum_list[element], element]);
      });

      DateTime now = DateTime.now();
      selectCurriculumTime.value.forEach((element) {
        DateTime plusOneDay = now.add(Duration(days: element[1]));
        String range = "${now.year}.${now.month}.${now.day} ~ ${plusOneDay.year}.${plusOneDay.month}.${plusOneDay.day}";
        selectCurriculumTime2.value.add([element[0], range, now, element[1]]);

        DateTime temp = now;
        for (int i = 0; i < element[1] + 1; i++) {
          CalanderPageController.to.addEvent(DateTime(temp.year, temp.month, temp.day), element[0], DreamColorChips.dream);
          temp = temp.add(const Duration(days: 1));
        }
        now = plusOneDay;
      });
    }

    if (sequence.value == 6) {
      Get.offAllNamed(Routes.home);
    }
  }

  bool get nextButtonEnabled {
    switch (sequence.value) {
      case 1:
        return isHollandCodeSelected;
      case 2:
        return isJobSelected;
      case 3:
        return isWorkSelected;
      case 4:
        return isCurriculumSelected;
      case 5:
        return true;

      default:
        return true;
    }
  }
}
