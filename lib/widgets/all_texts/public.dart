import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/modules/main/controllers/main_controller.dart';

class PublicTextWidget extends StatelessWidget {
  const PublicTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorCondition = Get.put(MainController());
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colorCondition.isDarkThemes.value == true
              ? const Color.fromARGB(255, 8, 157, 187)
              : const Color.fromARGB(255, 98, 205, 146),
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Text("Public"),
      ),
    );
  }
}
