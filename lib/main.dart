import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/main/views/main_view.dart';

void main() async {
  await GetStorage.init();
  runApp(const MainView());
}
