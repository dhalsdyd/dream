// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:glint/app/core/theme/color_theme.dart';
// import 'package:glint/app/core/theme/text_theme.dart';
// import 'package:glint/app/pages/schedule/controller.dart';
// import 'package:glint/app/widgets/button.dart';
// import 'package:glint/app/widgets/textfield.dart';

import 'dart:developer';

import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/core/theme/text_theme.dart';
import 'package:dream/app/pages/calander/controller.dart';
import 'package:dream/app/pages/dream/widget/dream_card.dart';
import 'package:dream/app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SelectModal {
  Widget newCategory() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: DreamColors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Color(0xff7c7c7c)),
          ),
        ],
      ),
    );
  }

  Widget category(DreamColorChips colorChip, String name) {
    return GestureDetector(
      onTap: () {
        Get.back(result: [name, colorChip]);
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: colorChip.backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: colorChip.color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: DreamTextTheme.medium14.copyWith(color: colorChip.color),
            ),
          ],
        ),
      ),
    );
  }

  Future show(String title, List<Widget> children, {Widget inform = const SizedBox()}) async {
    return showModalBottomSheet(
        context: Get.overlayContext!,
        barrierColor: Colors.transparent,
        builder: (context) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 16,
                    offset: const Offset(0, -4), // changes position of shadow
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(title, style: DreamTextTheme.semibold18),
                          const SizedBox(width: 4),
                          inform,
                        ],
                      ),
                      SvgPicture.asset("assets/icons/setting.svg")
                    ],
                  ),
                  const SizedBox(height: 16),
                  GridView(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: children),
                ],
              ),
            ),
          );
        });
  }

  Future showCategory() async {
    final result = await show("카테고리 선택", [category(DreamColorChips.green, "기본"), newCategory()]);
    log(result.toString());
    CalanderPageController.to.setCategory(result[0], result[1]);
  }

  void showSticker() {
    List<Widget> stickers = [];
    for (int i = 1; i < 9; i++) {
      stickers.add(Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: DreamColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset("assets/stickers/sticker_$i.png"),
      ));
    }
    show("스티커 선택", stickers);
  }

  Future<void> showDetail(String month, String day, String date, List works) async {
    String title = "$month월 $day일 $date요일";
    showModalBottomSheet(
        context: Get.overlayContext!,
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 16,
                    offset: const Offset(0, -4), // changes position of shadow
                  ),
                ]),
            child: KeyboardVisibilityBuilder(
              builder: (context, isKeyboardVisible) {
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      !isKeyboardVisible
                          ? Text(title, style: DreamTextTheme.semibold18)
                          : Obx(
                              () => Text(CalanderPageController.to.categoryName.value,
                                  style: DreamTextTheme.medium14.copyWith(color: CalanderPageController.to.categoryColor.value.color)),
                            ),
                      !isKeyboardVisible
                          ? Column(children: [
                              const SizedBox(height: 16),
                              ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxHeight: 250,
                                  ),
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return TodoCard(
                                          challenge: works[index][0],
                                          todo: works[index][0],
                                          colorChip: works[index][1],
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(height: 8);
                                      },
                                      itemCount: works.length)),
                              const SizedBox(height: 16),
                            ])
                          : const SizedBox(),
                      Obx(
                        () => DreamTextField(
                          controller: CalanderPageController.to.titleController,
                          onEditingComplete: CalanderPageController.to.onEditingComplete,
                          readOnly: !CalanderPageController.to.isCategorySelected ? true : false,
                          onTap: CalanderPageController.to.isCategorySelected
                              ? () async {
                                  await showCategory();
                                }
                              : null,
                          hintText: "할 일을 추가하세요",
                        ),
                      ),
                      !isKeyboardVisible ? const SizedBox(height: 24) : const SizedBox(),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}

// class PickSchedule {
//   int? parentId;
//   PickSchedule({this.parentId});
//   final SchedulePageController controller = Get.find<SchedulePageController>();

//   void show() {
//     showModalBottomSheet(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       context: Get.overlayContext!,
//       isScrollControlled: true,
//       isDismissible: true, // set this to true
//       useRootNavigator: true,
//       builder: (_) {
//         return DraggableScrollableSheet(
//           expand: false,
//           controller: controller.draggableScrollableController,
//           initialChildSize: 0.9,
//           minChildSize: 0.1,
//           maxChildSize: 0.9,
//           builder: (BuildContext context, ScrollController scrollController) {
//             return SingleChildScrollView(
//               controller: scrollController,
//               child: Padding(
//                 padding: const EdgeInsets.all(22.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: Container(
//                         decoration: const BoxDecoration(
//                             color: Colors.black,
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(100))),
//                         height: 5,
//                         width: 100,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Form(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const Text("일정 등록", style: AppTextTheme.T3),
//                               Obx(
//                                 () => TextButton(
//                                     onPressed: () {
//                                       controller.inputValidity
//                                           ? controller.addSchedule(parentId)
//                                           : null;
//                                     },
//                                     child: Text(
//                                       "등록",
//                                       style: AppTextTheme.Explain.copyWith(
//                                           color: controller.inputValidity
//                                               ? AppColorTheme.BUTTON1
//                                               : AppColorTheme.Gray2),
//                                     )),
//                               )
//                             ],
//                           ),
//                           const SizedBox(height: 16),
//                           Text("일정 이름",
//                               style: AppTextTheme.Main.copyWith(
//                                   color: AppColorTheme.Gray2)),
//                           GTTextFormField(
//                             controller: controller.scheduleNameController,
//                           ),
//                           const SizedBox(height: 16),
//                           Text("일정 내용",
//                               style: AppTextTheme.Main.copyWith(
//                                   color: AppColorTheme.Gray2)),
//                           GTTextFormField(
//                             controller: controller.scheduleContentController,
//                           ),
//                           const SizedBox(height: 16),

//                           // Switch with 하루종일
//                           Row(
//                             children: [
//                               Text("하루종일",
//                                   style: AppTextTheme.T5
//                                       .copyWith(color: AppColorTheme.Gray2)),
//                               //small Size Switch
//                               Obx(
//                                 () => Switch(
//                                   value: controller.isAllDay.value,
//                                   onChanged: (value) {
//                                     controller.isAllDay.value = value;
//                                   },
//                                   activeColor: AppColorTheme.BUTTON1,
//                                 ),
//                               ),
//                             ],
//                           ),

//                           Text("시작",
//                               style: AppTextTheme.Main.copyWith(
//                                   color: AppColorTheme.Gray2)),
//                           GTTextFormField(
//                             readOnly: true,
//                             onTap: () => controller.pickSchedule(),
//                             controller: controller.scheduleStartController,
//                           ),

//                           const SizedBox(height: 16),
//                           Text("종료",
//                               style: AppTextTheme.Main.copyWith(
//                                   color: AppColorTheme.Gray2)),
//                           GTTextFormField(
//                             readOnly: true,
//                             onTap: () =>
//                                 controller.pickSchedule(isStart: false),
//                             controller: controller.scheduleEndController,
//                           ),

//                           const SizedBox(height: 16),
//                           //categories
//                           Text("카테고리",
//                               style: AppTextTheme.Main.copyWith(
//                                   color: AppColorTheme.Gray2)),
//                           _categoryPicker(),
//                           const SizedBox(height: 16),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   Row _categoryPicker() {
//     return Row(
//       children: [
//         GTIconButton(
//           "assets/images/rabbi.svg",
//           onTap: controller.getCategory,
//         ),
//         Expanded(
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(
//               minHeight: 25,
//               maxHeight: 30,
//             ),
//             child: Obx(() {
//               if (controller.categories.value.isEmpty) {
//                 return const Center(
//                     child: Text(
//                   "카테고리가 없습니다.",
//                   textAlign: TextAlign.start,
//                 ));
//               }

//               return ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: controller.categories.value.length,
//                 itemBuilder: (context, index) {
//                   // radius random color
//                   return Container(
//                     margin: const EdgeInsets.only(right: 8),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: AppColorTheme.BUTTON1,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 8,
//                       ),
//                       child: Center(
//                         child: Text(
//                           controller.categories.value[index].name,
//                           style: AppTextTheme.T6
//                               .copyWith(color: AppColorTheme.white),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),
//         ),
//         // add iconbutton
//       ],
//     );
//   }
// }
