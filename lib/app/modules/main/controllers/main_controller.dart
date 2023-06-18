import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../themes_data/dark_themes.dart';
import '../../../../themes_data/light_themes.dart';

class MainController extends GetxController {
  final box = GetStorage();
  RxBool isDarkThemes = false.obs;
  String darkThemesKey = "darkThemes"; // themes status save key

  @override
  void onInit() {
    super.onInit();
    checkThemesData(); // on init page to call this function for check  themes status
  }

  checkThemesData() {
    bool data = box.read(darkThemesKey) ?? false;
    isDarkThemes.value = data;
  }

  toggleThemes() {
    // this function switch themes mode between dark and light
    isDarkThemes.value = !isDarkThemes.value;
    saveThemesData(isDarkThemes.value); // call themes status save function
    Get.changeTheme(isDarkThemes.value == true ? darkThemes : lightThemes);
    update();
  }

  saveThemesData(bool data) async {
    // this function save themes status on local storage
    await box.write(darkThemesKey, data);
  }
}
