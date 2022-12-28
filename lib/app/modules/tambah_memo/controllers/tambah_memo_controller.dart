import 'dart:math';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/models/memo_model.dart';
import '../../../data/db/db_manager.dart';

import 'package:sqflite/sqflite.dart';

class TambahMemoController extends GetxController {
  RxBool istunggu = false.obs;

  DatabaseManager database = DatabaseManager.instance;
  TextEditingController teksIsiC = TextEditingController();
  TextEditingController teksJudulC = TextEditingController();

  //fungsi tambah data SQL
  void tambahData() async {
    if (teksIsiC.text.isNotEmpty && teksJudulC.text.isNotEmpty) {
      istunggu.value = true;

      Database db = await database.db;

      db.insert("memo", {
        "id": Random().nextInt(1000),
        "isi": teksIsiC.text,
        "judul": teksJudulC.text
      });

      istunggu.value = false;
    }
  }
}
