import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../themes_data/dark_themes.dart';
import '../../../themes_data/light_themes.dart';
import '../../login/views/login_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => GetBuilder(
          init: controller,
          builder: (context) {
            return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                darkTheme: darkThemes,
                theme: lightThemes,
                themeMode: controller.isDarkThemes.value == true ? ThemeMode.dark : ThemeMode.light,
                home: child,
                initialRoute: AppPages.INITIAL,
                getPages: AppPages.routes);
          }),
      child: const LoginView(),
    );
  }
}
