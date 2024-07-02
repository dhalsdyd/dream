import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/core/theme/text_theme.dart';
import 'package:dream/app/pages/new_dream/controller.dart';
import 'package:dream/app/pages/new_dream/widget/new_dream_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewDreamPage extends GetView<NewDreamPageController> {
  const NewDreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DreamColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: DreamColors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ]),
          child: AppBar(
            backgroundColor: DreamColors.white,
            elevation: 0,
            title: Text("꿈 만들기", style: DreamTextTheme.medium18.copyWith(color: DreamColors.text2)),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: DreamColors.text1,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("EA", style: DreamTextTheme.medium18.copyWith(color: DreamColors.mainColor)),
                Text("에 알맞은 직업이에요", style: DreamTextTheme.medium18.copyWith(color: DreamColors.text2)),
              ],
            ),
            const SizedBox(height: 4),
            Text("어떤 활동을 해볼까요?", style: DreamTextTheme.medium18.copyWith(color: DreamColors.text2)),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: JobCard(
                          job: controller.job_list[index][0],
                          description: controller.job_list[index][1],
                          task: controller.job_list[index][2],
                          progress: controller.job_list[index][3]),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 8),
                  itemCount: controller.job_list.length),
            ),
          ],
        ),
      )),
    );
  }
}
