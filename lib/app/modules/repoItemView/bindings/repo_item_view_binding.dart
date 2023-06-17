import 'package:get/get.dart';

import '../controllers/repo_item_view_controller.dart';

class RepoItemViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepoItemViewController>(
      () => RepoItemViewController(),
    );
  }
}
