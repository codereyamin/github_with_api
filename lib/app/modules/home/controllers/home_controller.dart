import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../widgets/all_texts/common_text.dart';
import '../../main/controllers/main_controller.dart';
import '../models/user_model.dart';
import '../models/user_repo_model.dart';

class HomeController extends GetxController {
  Dio dio = Dio();
  UserModel? userModel;
  RxInt itemBuildSize = 0.obs;
  RxList<UserRepoModel> userRepoModel = <UserRepoModel>[].obs;
  RxBool isloading = false.obs;
  @override
  void onInit() async {
    isloading.value = true;
    final userName = Get.arguments;
    await dataLoad(userName: userName);
    isloading.value = false;
    super.onInit();
  }

  dataLoad({required String userName}) async {
    try {
      await onLodeUserData(username: userName);
    } catch (err) {
      Get.back();
      showErrDialog(userName: userName);
      throw "user name not found";
    }
  }

  onLodeUserData({required String username}) async {
    final data = await dio.get("https://api.github.com/users/$username");
    if (data.statusCode == 200) {
      userModel = UserModel.fromJson(data.data);
      await onLodeUserRepoData(username: username);
    }
  }

  onLodeUserRepoData({required String username}) async {
    final data = await dio.get("https://api.github.com/users/$username/repos");
    if (data.statusCode == 200) {
      for (var element in data.data) {
        userRepoModel.add(UserRepoModel.fromJson(element));
      }
      itemBuildSize.value = userRepoModel.length;
    }
  }

  RxBool isGridView = false.obs;
  onChangeGridView() {
    isGridView.value = !isGridView.value;
  }

  showErrDialog({required String userName}) => Get.bottomSheet(
      enterBottomSheetDuration: const Duration(milliseconds: 400),
      exitBottomSheetDuration: const Duration(milliseconds: 400),
      StatefulBuilder(
        builder: (context, setState) => Container(
          width: double.maxFinite,
          height: 80.h,
          alignment: Alignment.center,
          color: const Color.fromARGB(255, 130, 122, 58),
          child: Text("Not found $userName on website"),
        ),
      ));

  showShortDialog() => Get.bottomSheet(
          enterBottomSheetDuration: const Duration(milliseconds: 400),
          exitBottomSheetDuration: const Duration(milliseconds: 400), StatefulBuilder(
        builder: (context, setState) {
          final colorController = Get.put(MainController());
          return Container(
            width: double.maxFinite,
            height: 280.h,
            alignment: Alignment.center,
            color: colorController.isDarkThemes.value == true
                ? const Color.fromARGB(255, 86, 85, 119)
                : const Color.fromARGB(255, 195, 195, 209),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: const CommonText(name: "Name a - z", fontSize: 18),
                    ),
                    onTap: () {
                      nameA2Z();
                    },
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: const CommonText(name: "Name z - a", fontSize: 18),
                    ),
                    onTap: () {
                      nameZ2A();
                    },
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: const CommonText(name: "Date order by create", fontSize: 18),
                    ),
                    onTap: () {
                      dateCreate();
                    },
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: const CommonText(name: "Date order by update", fontSize: 18),
                    ),
                    onTap: () {
                      dateUpdate();
                    },
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: const CommonText(name: "Date order by push", fontSize: 18),
                    ),
                    onTap: () {
                      datePush();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ));

  nameA2Z() {
    userRepoModel.sort(
      (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()),
    );
    userRepoModel.refresh();
    Get.back();
  }

  nameZ2A() {
    userRepoModel.sort(
      (a, b) => b.name!.toLowerCase().compareTo(a.name!.toLowerCase()),
    );
    userRepoModel.refresh();
    Get.back();
  }

  dateCreate() {
    userRepoModel.sort(
      (a, b) => a.createdAt!.compareTo(b.createdAt!),
    );
    userRepoModel.refresh();
    Get.back();
  }

  dateUpdate() {
    userRepoModel.sort(
      (a, b) => b.updatedAt!.compareTo(a.updatedAt!),
    );
    userRepoModel.refresh();
    Get.back();
  }

  datePush() {
    userRepoModel.sort(
      (a, b) => b.pushedAt!.compareTo(a.pushedAt!),
    );
    userRepoModel.refresh();
    Get.back();
  }
}
