import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../widgets/all_texts/common_text.dart';
import '../../../widgets/common_app_bar.dart';
import '../../../widgets/views_Card/grid_view_card.dart';
import '../../../widgets/views_Card/list_view_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Home View"),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isloading.value == true
              ? Container(
                  width: double.infinity,
                  height: 600.h,
                  alignment: Alignment.center,
                  child: Container(
                    width: 250.h,
                    padding: const EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                            width: 80.h, height: 80.h, child: const CircularProgressIndicator()),
                        SizedBox(
                          height: 30.h,
                        ),
                        const Text("Loading..."),
                        SizedBox(
                          height: 20.h,
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.close),
                            label: const Text("Cancel")),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                )
              : Column(children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 100.h,
                        height: 100.h,
                        child: FadeInImage(
                          image: NetworkImage(controller.userModel?.avatarUrl ?? ""),
                          placeholder: const AssetImage('assets/avatar.jpg'),
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/error.png', fit: BoxFit.fitWidth);
                          },
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                              name: controller.userModel?.name ?? "",
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          CommonText(
                            name: controller.userModel?.login ?? "",
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CommonText(
                    maxLines: 5,
                    name: controller.userModel!.bio ?? "",
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => controller.showShortDialog(),
                          child: const CommonText(
                            name: "Sort ^",
                          ),
                        ),
                        const CommonText(
                          name: "Repo List",
                        ),
                        IconButton(
                            onPressed: () {
                              controller.onChangeGridView();
                            },
                            icon: Obx(() => controller.isGridView.value == true
                                ? Icon(
                                    Icons.list,
                                    size: 30.h,
                                  )
                                : Icon(
                                    Icons.grid_view,
                                    size: 25.h,
                                  )))
                      ],
                    ),
                  ),
                  Obx(
                    () => controller.isGridView.value == true
                        ? SizedBox(
                            height: 100 * controller.itemBuildSize.value.toDouble(),
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.userRepoModel.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                              itemBuilder: (context, index) => GridViewCard(
                                date: controller.userRepoModel[index].createdAt.toString(),
                                repoName: controller.userRepoModel[index].name.toString(),
                                url: controller.userRepoModel[index].htmlUrl.toString(),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 140 * controller.itemBuildSize.value.toDouble(),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.userRepoModel.length,
                              itemBuilder: (context, index) {
                                return ListViewCard(
                                  date: controller.userRepoModel[index].createdAt.toString(),
                                  repoName: controller.userRepoModel[index].name.toString(),
                                  url: controller.userRepoModel[index].htmlUrl.toString(),
                                );
                              },
                            ),
                          ),
                  )
                ]),
        ),
      ),
    );
  }
}
