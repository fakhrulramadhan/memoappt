import 'package:get/get.dart';

import '../models/memo_model.dart';

class MemoProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Memo.fromJson(map);
      if (map is List) return map.map((item) => Memo.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Memo?> getMemo(int id) async {
    final response = await get('memo/$id');
    return response.body;
  }

  Future<Response<Memo>> postMemo(Memo memo) async => await post('memo', memo);
  Future<Response> deleteMemo(int id) async => await delete('memo/$id');
}
