import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../widgets/common_app_bar.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      appBar: const CommonAppBar(title: "User Input"),
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
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 5, color: Colors.grey.shade500)),
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
              ],
            )),
        SizedBox(
          height: 40.w,
        ),
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
