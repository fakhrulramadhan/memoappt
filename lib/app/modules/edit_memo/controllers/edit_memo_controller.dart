import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data/db/db_manager.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:math';

import '../../home/controllers/home_controller.dart';

class EditMemoController extends GetxController {
  RxBool istunggu = false.obs;

  TextEditingController teksIsiC = TextEditingController();
  TextEditingController teksJudulC = TextEditingController();

  HomeController homeC = Get.find(); //menemukan controller yang lain

  DatabaseManager database = DatabaseManager.instance;

  //fungsi edit memo
  void editMemo(int id) async {
    Database db = await database.db;

    await db.update(
        "memo",
        {
          "id": Random().nextInt(1000),
          "judul": teksJudulC.text,
          "isi": teksIsiC.text
        },
        where: "id = ?",
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  void hapusMemo(int id) async {
    Database db = await database.db;

    await db.delete("memo", where: "id = ?", whereArgs: [id]);

    //homeC.dapatSemuamemo(); //agar dapat bisa refresh tampilan,ditaruh di view
  }
}
