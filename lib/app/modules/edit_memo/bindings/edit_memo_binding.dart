import 'package:get/get.dart';

import '../controllers/edit_memo_controller.dart';

class EditMemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMemoController>(
      () => EditMemoController(),
    );
  }
}
