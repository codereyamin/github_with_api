import 'package:get/get.dart';

import '../controllers/item_view_controller.dart';

class ItemViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemViewController>(
      () => ItemViewController(),
    );
  }
}
