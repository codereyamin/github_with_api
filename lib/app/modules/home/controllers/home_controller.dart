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
  RxList<UserRepoModel> userRepoList = <UserRepoModel>[].obs;
  RxBool isloading = false.obs;
  RxBool isGridView = false.obs;

  @override
  void onInit() async {
    isloading.value = true;
    final userName = Get.arguments; // receive user name
    await dataLoad(userName: userName); // user data load function call
    isloading.value = false;
    super.onInit();
  }

  // try user data load function
  //error handel
  dataLoad({required String userName}) async {
    try {
      await onLodeUserData(username: userName);
    } catch (err) {
      Get.back();
      showErrDialog(userName: userName);
      throw "user name not found";
    }
  }

// user data load function
  onLodeUserData({required String username}) async {
    final data = await dio.get("https://api.github.com/users/$username");
    //succuss to user data load
    if (data.statusCode == 200) {
      //convert json to dart
      userModel = UserModel.fromJson(data.data);

      // call user repository data function
      await onLodeUserRepoData(username: username);
    }
  }

// user repository data load function
  onLodeUserRepoData({required String username}) async {
    final data = await dio.get("https://api.github.com/users/$username/repos");
    if (data.statusCode == 200) {
      // list of json data convert dart
      for (var element in data.data) {
        userRepoList.add(UserRepoModel.fromJson(element));
      }
      // repository data length pick
      // ui need to heigh build widget
      itemBuildSize.value = userRepoList.length;
    }
  }

  //this function change between list view and grid view
  onChangeGridView() {
    isGridView.value = !isGridView.value;
  }

  // error message function
  showErrDialog({required String userName}) => Get.bottomSheet(
      enterBottomSheetDuration: const Duration(milliseconds: 400),
      exitBottomSheetDuration: const Duration(milliseconds: 400),
      StatefulBuilder(
        builder: (context, setState) => Container(
          width: double.maxFinite,
          height: 80.h,
          alignment: Alignment.center,
          color: const Color.fromARGB(255, 130, 122, 58),
          child: Text("Not found this user $userName on github "),
        ),
      ));

  /// short option show using this function
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
                      nameA2Z(); // call function
                    },
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: const CommonText(name: "Name z - a", fontSize: 18),
                    ),
                    onTap: () {
                      nameZ2A(); // call function
                    },
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: const CommonText(name: "Date order by create", fontSize: 18),
                    ),
                    onTap: () {
                      dateCreate(); // call function
                    },
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: const CommonText(name: "Date order by update", fontSize: 18),
                    ),
                    onTap: () {
                      dateUpdate(); // call function
                    },
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: const CommonText(name: "Date order by push", fontSize: 18),
                    ),
                    onTap: () {
                      datePush(); // call function
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ));

  // this function order by alphabetic  a to z
  nameA2Z() {
    userRepoList.sort(
      (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()),
    );
    userRepoList.refresh();
    Get.back();
  }

  // this function order by alphabetic  z to a
  nameZ2A() {
    userRepoList.sort(
      (a, b) => b.name!.toLowerCase().compareTo(a.name!.toLowerCase()),
    );
    userRepoList.refresh();
    Get.back();
  }

// this function order by date on create
  dateCreate() {
    userRepoList.sort(
      (a, b) => a.createdAt!.compareTo(b.createdAt!),
    );
    userRepoList.refresh();
    Get.back();
  }

// this function order by date on update
  dateUpdate() {
    userRepoList.sort(
      (a, b) => b.updatedAt!.compareTo(a.updatedAt!),
    );
    userRepoList.refresh();
    Get.back();
  }

// this function order by date on push
  datePush() {
    userRepoList.sort(
      (a, b) => b.pushedAt!.compareTo(a.pushedAt!),
    );
    userRepoList.refresh();
    Get.back();
  }
}
