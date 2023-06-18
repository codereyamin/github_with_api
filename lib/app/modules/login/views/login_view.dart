import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../widgets/common_app_bar.dart';

import '../../main/controllers/main_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    final colorController =
        Get.put(MainController()); // this controller call using ui color change depend on themes
    return Scaffold(
      appBar: const CommonAppBar(title: "User Name Input"),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: const Text(
                    "User Name",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),

                // input text field
                Obx(
                  () => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 5,
                            color: colorController.isDarkThemes.value == true
                                ? Color.fromARGB(255, 142, 75, 75)
                                : Colors.grey.shade500)),
                    child: TextField(
                      controller: controller.inputTextController,
                      decoration: const InputDecoration(
                        hintText: "Enter your user name....",
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )),
        SizedBox(
          height: 40.w,
        ),

        // submit button
        ElevatedButton.icon(
            onPressed: () {
              controller.checkValue();
            },
            icon: const Icon(Icons.arrow_circle_right),
            label: const Text("Search"))
      ]),
    );
  }
}
