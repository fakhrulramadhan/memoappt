import 'package:get/get.dart';
import '../../../data/db/db_manager.dart';
import 'package:sqflite/sqflite.dart';
import '../../../data/models/memo_model.dart';

class HomeController extends GetxController {
  //controller utk menampilkan data dari database
  RxList semuaMemo = <Memo>[].obs;

  DatabaseManager database = DatabaseManager.instance;

  Future dapatSemuamemo() async {
    Database db = await database.db;

    //buat ambil data tabel dengan .query
    List<Map<String, dynamic>> data = await db.query("memo");

    if (data.isNotEmpty) {
      //semua data semuamemo langsung tambah ke memo tojsonlist
      semuaMemo(Memo.toJsonList(data));
      semuaMemo.refresh(); //refresh database
    } else {
      //diclearkan,semua data kosong
      semuaMemo.clear();
      semuaMemo.refresh();
    }
  }

  //delete memonya di bagian edit
  @override
  void onInit() {
    // TODO: implement onInit
    dapatSemuamemo();
    super.onInit();
  }
}
