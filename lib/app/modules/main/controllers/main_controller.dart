import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../themes_data/dark_themes.dart';
import '../../../../themes_data/light_themes.dart';

class MainController extends GetxController {
  final box = GetStorage();
  RxBool isDarkThemes = false.obs;
  String darkThemesKey = "darkThemes";

  @override
  void onInit() {
    super.onInit();
    checkThemesData();
  }

  checkThemesData() {
    bool data = box.read(darkThemesKey) ?? false;
    log(data.toString());
    isDarkThemes.value = data;
  }

  toggleThemes() {
    isDarkThemes.value = !isDarkThemes.value;
    saveThemesData(isDarkThemes.value);
    Get.changeTheme(isDarkThemes.value == true ? darkThemes : lightThemes);
    update();
  }

  saveThemesData(bool data) async {
    log(data.toString());
    await box.write(darkThemesKey, data);
  }
}
