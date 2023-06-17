import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/main/controllers/main_controller.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return PreferredSize(
      preferredSize: const Size(double.infinity, 60),
      child: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(title),
            IconButton(
                onPressed: () {
                  controller.toggleThemes();
                },
                icon: Obx(() => controller.isDarkThemes.value == true
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode)))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
