import 'package:get/get.dart';

import '../controllers/tambah_memo_controller.dart';

class TambahMemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahMemoController>(
      () => TambahMemoController(),
    );
  }
}
