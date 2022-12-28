class Memo {
  int? id;
  String? judul;
  String? isi;

  Memo({this.id, this.judul, this.isi});

  Memo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    isi = json['isi'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['judul'] = judul;
    data['isi'] = isi;
    return data;
  }

  //fungsi tojsonlist utk menampilkan semua data
  static List<Memo> toJsonList(List? data) {
    if (data == null || data.isEmpty) return [];

    return data.map((e) => Memo.fromJson(e)).toList();
  }
}
