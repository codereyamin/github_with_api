import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

loadingdilog({required String data}) {
  Get.dialog(
      barrierDismissible: false,
      Dialog(
        backgroundColor: Colors.transparent,
        child: WillPopScope(
          onWillPop: () async => false,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(width: 80.h, height: 80.h, child: const CircularProgressIndicator()),
                SizedBox(
                  height: 30.h,
                ),
                Text(data),
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
        ),
      ));
}
