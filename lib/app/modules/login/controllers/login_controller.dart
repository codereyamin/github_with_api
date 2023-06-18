import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController inputTextController = TextEditingController();
  // input text field validation function
  checkValue() {
    if (inputTextController.text.isEmpty) {
      showCustomDialog(inputText: "User name input..");
    } else if (inputTextController.text.contains(" ")) {
      showCustomDialog(inputText: "User name invalid");
    } else {
      Get.toNamed(Routes.HOME, arguments: inputTextController.text);
    }
  }

  // show err in bottom sheet using this function
  showCustomDialog({required String inputText}) => Get.bottomSheet(
      enterBottomSheetDuration: const Duration(milliseconds: 400),
      exitBottomSheetDuration: const Duration(milliseconds: 400),
      StatefulBuilder(
        builder: (context, setState) => Container(
          width: double.maxFinite,
          height: 100,
          alignment: Alignment.center,
          color: const Color.fromARGB(255, 130, 122, 58),
          child: Text(inputText),
        ),
      ));
}
