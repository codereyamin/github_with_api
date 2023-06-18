import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:inilabs_assignment/app/modules/main/controllers/main_controller.dart';

import '../../../../widgets/all_texts/common_text.dart';
import '../../../../widgets/common_app_bar.dart';
import '../../../../widgets/views_Card/grid_view_card.dart';
import '../../../../widgets/views_Card/list_view_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final colorController =
        Get.put(MainController()); // this controller call using ui color change depend on themes
    return Scaffold(
      appBar: const CommonAppBar(title: "Home View"),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isloading.value == true // hold screen and loading message show
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
                  // user image and name
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
                    name: controller.userModel!.bio ?? "", // user bio
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  // user button section
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // sort item multiples order
                        GestureDetector(
                          onTap: () => controller.showShortDialog(),
                          child: const CommonText(
                            name: "Sort ^",
                          ),
                        ),
                        const CommonText(
                          name: "Repo List",
                        ),
                        // list and grid button
                        IconButton(
                            onPressed: () {
                              controller.onChangeGridView();
                            },
                            icon: Obx(() => controller.isGridView.value == true
                                ? Icon(
                                    Icons.list,
                                    size: 30.h,
                                    color: colorController.isDarkThemes.value == true
                                        ? Colors.white
                                        : Colors.black,
                                  )
                                : Icon(
                                    Icons.grid_view,
                                    size: 25.h,
                                    color: colorController.isDarkThemes.value == true
                                        ? Colors.white
                                        : Colors.black,
                                  )))
                      ],
                    ),
                  ),
                  Obx(
                    // toggle between list and grid view
                    () => controller.isGridView.value == true
                        ? SizedBox(
                            height: 100 * controller.itemBuildSize.value.toDouble(),
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.userRepoList.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                              itemBuilder: (context, index) => GridViewCard(
                                date: controller.userRepoList[index].createdAt.toString(),
                                repoName: controller.userRepoList[index].name.toString(),
                                url: controller.userRepoList[index].htmlUrl.toString(),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 140 * controller.itemBuildSize.value.toDouble(),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.userRepoList.length,
                              itemBuilder: (context, index) {
                                return ListViewCard(
                                  date: controller.userRepoList[index].createdAt.toString(),
                                  repoName: controller.userRepoList[index].name.toString(),
                                  url: controller.userRepoList[index].htmlUrl.toString(),
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
