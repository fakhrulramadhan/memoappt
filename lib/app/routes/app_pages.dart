import 'package:get/get.dart';

import 'package:memoapp/app/modules/edit_memo/bindings/edit_memo_binding.dart';
import 'package:memoapp/app/modules/edit_memo/views/edit_memo_view.dart';
import 'package:memoapp/app/modules/home/bindings/home_binding.dart';
import 'package:memoapp/app/modules/home/views/home_view.dart';
import 'package:memoapp/app/modules/tambah_memo/bindings/tambah_memo_binding.dart';
import 'package:memoapp/app/modules/tambah_memo/views/tambah_memo_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MEMO,
      page: () => EditMemoView(),
      binding: EditMemoBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_MEMO,
      page: () => TambahMemoView(),
      binding: TambahMemoBinding(),
    ),
  ];
}
