import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../app/modules/itemView/views/item_view_view.dart';
import '../../app/modules/main/controllers/main_controller.dart';
import '../all_texts/public.dart';
import '../all_texts/repo_name.dart';
import '../all_texts/update_on.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({super.key, required this.date, required this.repoName, required this.url});

  final String date;
  final String repoName;
  final String url;

  @override
  Widget build(BuildContext context) {
    final colorCondition = Get.put(MainController());
    return GestureDetector(
      onTap: () => Get.to(const ItemViewView(), arguments: url),
      child: Obx(
        () => Container(
          height: 200,
          decoration: BoxDecoration(
              color: colorCondition.isDarkThemes.value == true
                  ? const Color.fromARGB(255, 158, 100, 139)
                  : const Color.fromARGB(255, 246, 240, 150)),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RepoNameText(repoName: repoName),
                  SizedBox(
                    height: 15.h,
                  ),
                  const PublicTextWidget(),
                  SizedBox(
                    height: 15.h,
                  ),
                  UpdateOnText(updateDate: date, isGridView: true),
                  SizedBox(
                    height: 5.h,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
