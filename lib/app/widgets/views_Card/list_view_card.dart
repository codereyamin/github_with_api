import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../modules/main/controllers/main_controller.dart';
import '../../modules/repoItemView/views/repo_item_view_view.dart';
import '../all_texts/public.dart';
import '../all_texts/repo_name.dart';
import '../all_texts/update_on.dart';

class ListViewCard extends StatelessWidget {
  const ListViewCard({
    Key? key,
    required this.date,
    required this.repoName,
    required this.url,
  }) : super(key: key);
  final String date;
  final String repoName;
  final String url;
  @override
  Widget build(BuildContext context) {
    final colorCondition = Get.put(MainController());
    return GestureDetector(
      onTap: () => Get.to(const RepoItemViewView(), arguments: url),
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: colorCondition.isDarkThemes.value
                ? const Color.fromARGB(255, 61, 131, 97)
                : const Color.fromARGB(255, 154, 159, 77),
          ),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 280.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 190.w, child: RepoNameText(repoName: repoName)),
                        SizedBox(
                          width: 20.h,
                        ),
                        const PublicTextWidget(),
                      ],
                    ),
                  ),
                  UpdateOnText(updateDate: date, isGridView: false),
                ]),
          ),
        ),
      ),
    );
  }
}
