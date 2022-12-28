import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_memo_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../../data/models/memo_model.dart';

import 'package:google_fonts/google_fonts.dart';

class EditMemoView extends GetView<EditMemoController> {
  //ambil parameter arguments
  Memo memo = Get.arguments;

  //memanggil homecontroller dengan getfind
  HomeController homeC = Get.find();

  @override
  Widget build(BuildContext context) {
    //mengambil data teksfield berdasarkan yang sudah diisi sebelumnya
    controller.teksIsiC.text = memo.isi!;
    controller.teksJudulC.text = memo.judul!;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Edit Memo',
            style: GoogleFonts.redHatDisplay(
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 219, 255, 121),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 20),
          children: [
            TextField(
              controller: controller.teksIsiC,
              autocorrect: false,
              decoration: InputDecoration(
                  label: Text("Judul",
                      style: GoogleFonts.abel(
                          fontSize: 20, fontWeight: FontWeight.w400)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: 5,
              controller: controller.teksJudulC,
              decoration: InputDecoration(
                  label: Text("Isi"),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown))),
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(() => TextButton(
                  onPressed: () async {
                    controller.editMemo(memo.id!);
                    await homeC.dapatSemuamemo();
                    Get.back();
                  },
                  child: Text(
                    controller.istunggu.isFalse ? "Edit Memo" : "Tunggu....",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 221, 199, 0)),
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () async {
                controller.hapusMemo(memo.id!);
                await homeC.dapatSemuamemo();
                Get.back();
              },
              child: Text(
                controller.istunggu.isFalse ? "Hapus Memo" : "Tunggu...",
                style: const TextStyle(color: Color.fromARGB(255, 0, 189, 202)),
              ),
            )
          ],
        ));
  }
}
