// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class NewDreamPageController extends GetxController with StateMixin {
  static NewDreamPageController get to => Get.find<NewDreamPageController>(); // add this line

  final List job_list = [
    ["광고/홍보/마케팅 전문가", "서로 다른 나라의 언어를 번역하는 일을 해요", 4, 1],
    ["마케팅/광고/홍보 관리자", "서로 다른 나라의 언어를 번역하는 일을 해요", 4, 4],
    ["상품 기획자", "서로 다른 나라의 언어를 번역하는 일을 해요", 1, 0],
    ["예술/디자인/방송 관리자", "서로 다른 나라의 언어를 번역하는 일을 해요", 1, 0],
    ["웹 기획자", "서로 다른 나라의 언어를 번역하는 일을 해요", 1, 0],
    ["퍼스널 쇼퍼", "서로 다른 나라의 언어를 번역하는 일을 해요", 1, 0],
    ["행사 기획자", "서로 다른 나라의 언어를 번역하는 일을 해요", 1, 0],
  ];
}
