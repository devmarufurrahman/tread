import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/core/utils/constants/api_url.dart';

mixin MixinGetTotalFriend {
  final RxInt getTotalFriend = 0.obs;
  final token = TokenDatasource.getToken();
  Future<void> getTotalAddedFriend() async {
    final response = await http.get(
      Uri.parse(ApiUrl.getTotalFrient),
      headers: {'Accept': 'application/json', 'Authorization': token ?? ''},
    );

    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          getTotalFriend.value = data['data']['totalFriend'];
        }
      }
    } catch (e) {
      print("Cant fetch the total friend: $e");
    }
  }
}
