import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/item_view_controller.dart';

class ItemViewView extends GetView<ItemViewController> {
  const ItemViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ItemViewController());
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: controller.webController),
      ),
    );
  }
}
