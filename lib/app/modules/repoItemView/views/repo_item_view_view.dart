import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/repo_item_view_controller.dart';

class RepoItemViewView extends GetView<RepoItemViewController> {
  const RepoItemViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(RepoItemViewController());
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: controller.webController),
      ),
    );
  }
}
