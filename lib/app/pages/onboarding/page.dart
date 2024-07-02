import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/core/theme/text_theme.dart';
import 'package:dream/app/core/util/holland.dart';
import 'package:dream/app/pages/onboarding/controller.dart';
import 'package:dream/app/pages/onboarding/widget/onboarding_card.dart';
import 'package:dream/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage extends GetView<OnboardingPageController> {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DreamColors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xfff9f9f9),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Obx(
                  () => Container(
                    width: controller.sequence.value * (MediaQuery.of(context).size.width / 5),
                    height: 4,
                    decoration: BoxDecoration(
                      color: DreamColors.mainColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Obx(() => Expanded(child: _buildSequence(controller.sequence.value))),
            const SizedBox(height: 24),
            Obx(
              () => DreamKeyboardReactiveButton(
                onTap: controller.next,
                disabled: !controller.nextButtonEnabled,
                child: Text("확인", style: DreamTextTheme.semiboldGrey16.copyWith(color: DreamColors.white)),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildSequence(int sequence) {
    switch (sequence) {
      case 1:
        return _first();
      case 2:
        return _second();
      case 3:
        return _third();
      case 4:
        return _fourth();
      case 5:
        return _fifth();
      default:
        return Container();
    }
  }

  Column _fifth() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(controller.recommand_list[controller.selectWork.value ?? 0], style: DreamTextTheme.medium18.copyWith(color: DreamColors.mainColor)),
      const SizedBox(height: 4),
      Text("를 위한 추천 커리큘럼 추천 일정", style: DreamTextTheme.medium18.copyWith(color: DreamColors.text2)),
      const SizedBox(height: 8),
      Text("눌러서 날짜를 수정할 수 있어요", style: DreamTextTheme.medium16.copyWith(color: DreamColors.color5)),
      const SizedBox(height: 32),
      Expanded(
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ScheduleCard(
              work: controller.selectCurriculumTime2.value[index][0],
              range: controller.selectCurriculumTime2.value[index][1],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: controller.selectCurriculumTime2.value.length,
        ),
      ),
    ]);
  }

  Column _fourth() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(controller.recommand_list[controller.selectWork.value ?? 0], style: DreamTextTheme.medium18.copyWith(color: DreamColors.mainColor)),
      const SizedBox(height: 4),
      Text("를 위한 추천 커리큘럼", style: DreamTextTheme.medium18.copyWith(color: DreamColors.text2)),
      const SizedBox(height: 8),
      Text("건너뛰고 싶은 활동이 있다면 해제해주세요", style: DreamTextTheme.medium16.copyWith(color: DreamColors.color5)),
      const SizedBox(height: 32),
      Expanded(
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Obx(
              () => GestureDetector(
                onTap: () {
                  controller.setCurriculum(index);
                },
                child: RecommandCard(work: controller.curriculum_list[index], selected: controller.isSelectedCurriculum(index)),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: controller.curriculum_list.length,
        ),
      ),
    ]);
  }

  Column _third() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(controller.job_list[controller.selectedJob.value ?? 0][0], style: DreamTextTheme.medium18.copyWith(color: DreamColors.mainColor)),
        const SizedBox(height: 4),
        Text("가 되기 위한 추천 활동 중 1개 선택", style: DreamTextTheme.medium18.copyWith(color: DreamColors.text2)),
        const SizedBox(height: 8),
        Text("선택되지 않은 활동은 꿈방 > 꿈 만들기에서 할 수 있어요", style: DreamTextTheme.medium16.copyWith(color: DreamColors.color5)),
        const SizedBox(height: 32),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.setWork(index);
                  },
                  child: RecommandCard(work: controller.recommand_list[index], selected: controller.isSelectedWork(index)),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: controller.recommand_list.length,
          ),
        ),
      ],
    );
  }

  Column _second() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(controller.firstHollandCode.value + controller.secondHollandCode.value,
                style: DreamTextTheme.medium18.copyWith(color: DreamColors.mainColor)),
            Text("에 알맞은 직업이에요", style: DreamTextTheme.medium18.copyWith(color: DreamColors.text2)),
          ],
        ),
        const SizedBox(height: 4),
        Text("관심 있는 직업 하나를 선택해주세요", style: DreamTextTheme.medium18.copyWith(color: DreamColors.text2)),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.setJob(index);
                    },
                    child: JobCard(
                        job: controller.job_list[index][0], description: controller.job_list[index][1], selected: controller.isSelectedJob(index)),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: controller.job_list.length),
        ),
      ],
    );
  }

  Column _first() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("나와 가장 맞는 코드는 무엇인가요?", style: DreamTextTheme.medium18.copyWith(color: DreamColors.text2)),
      const SizedBox(height: 4),
      Text("1순위와 2순위를 선택해주세요", style: DreamTextTheme.medium18.copyWith(color: DreamColors.text2)),
      const SizedBox(height: 24),
      Expanded(
        child: Obx(
          () => GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              children: Holland.values
                  .map((e) => GestureDetector(
                        onTap: () {
                          controller.setHollandCode(e);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: controller.selectedfirstCode(e)
                                ? DreamColors.mainColor
                                : controller.selectedSecondCode(e)
                                    ? DreamColors.key
                                    : DreamColors.color4,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                  Text(e.code,
                                      style: DreamTextTheme.medium48.copyWith(
                                          color: controller.selectedfirstCode(e) || controller.selectedSecondCode(e)
                                              ? DreamColors.white
                                              : DreamColors.mainColor)),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(e.tags[0],
                                          style: DreamTextTheme.medium14.copyWith(
                                              color: controller.selectedfirstCode(e) || controller.selectedSecondCode(e)
                                                  ? DreamColors.white
                                                  : DreamColors.mainColor)),
                                      const SizedBox(height: 2),
                                      Text(e.tags[1],
                                          style: DreamTextTheme.medium14.copyWith(
                                              color: controller.selectedfirstCode(e) || controller.selectedSecondCode(e)
                                                  ? DreamColors.white
                                                  : DreamColors.mainColor)),
                                    ],
                                  )
                                ]),
                                const SizedBox(height: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(e.description[0],
                                        style: DreamTextTheme.medium12.copyWith(
                                            color: controller.selectedfirstCode(e) || controller.selectedSecondCode(e)
                                                ? DreamColors.white
                                                : DreamColors.color5)),
                                    Text(e.description[1],
                                        style: DreamTextTheme.medium12.copyWith(
                                            color: controller.selectedfirstCode(e) || controller.selectedSecondCode(e)
                                                ? DreamColors.white
                                                : DreamColors.color5)),
                                    Text(e.description[2],
                                        style: DreamTextTheme.medium12.copyWith(
                                            color: controller.selectedfirstCode(e) || controller.selectedSecondCode(e)
                                                ? DreamColors.white
                                                : DreamColors.color5)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList()),
        ),
      ),
    ]);
  }
}
