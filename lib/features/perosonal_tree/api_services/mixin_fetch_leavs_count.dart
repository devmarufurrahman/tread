import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/core/utils/constants/api_url.dart';

mixin MixinFetchLeavsCount {
  final RxInt leavesCount = 0.obs;
  Future<void> fetchLeavesCount() async {
    try {
      final token = TokenDatasource.getToken();

      final response = await http.get(
        Uri.parse(ApiUrl.leaveCount),
        headers: {'Accept': 'application/json', 'Authorization': token ?? ''},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == true && data['data'] != null) {
          leavesCount.value = data['data']['leaves'];
        }
      }
    } catch (e) {
      print('Error fetching leaves count: $e');
    }
  }
}
