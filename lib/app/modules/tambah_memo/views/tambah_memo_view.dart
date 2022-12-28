import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_memo_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../../data/models/memo_model.dart';

import 'package:google_fonts/google_fonts.dart';

class TambahMemoView extends GetView<TambahMemoController> {
  //getfind utk ambil fungsi refresh database
  final HomeController homecont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.fast_rewind,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            'Tambah Memo',
            style: GoogleFonts.dmSerifText(
                fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 219, 255, 121),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 20),
          children: [
            TextField(
              controller: controller.teksJudulC,
              autocorrect: false,
              decoration: InputDecoration(
                  label: Text("Judul",
                      style: GoogleFonts.almendraDisplay(
                          fontSize: 20, fontWeight: FontWeight.w300)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 3.0))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: 5,
              controller: controller.teksIsiC,
              decoration: InputDecoration(
                  label: Text("Isi"),
                  border: OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 3.0))),
            ),
            SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () async {
                //jika istunggu mati / false, maka nambah data
                if (controller.istunggu.isFalse) {
                  controller.tambahData();
                  await homecont.dapatSemuamemo(); //refresh data memo
                  Get.back(); //kembali ke halaman awal
                }
              },
              child: Text(
                controller.istunggu.isFalse ? "Tambah Memo" : "Tunggu....",
                style: TextStyle(
                    color: Color.fromARGB(255, 221, 199, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ));
  }
}
