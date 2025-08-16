import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/core/utils/constants/api_url.dart';
import 'package:tread256/features/perosonal_tree/models/intentional_acts_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

mixin MixinFetchIntentionalAct {
  final RxBool isLoadingIntentionalActs = false.obs;
  var isIntentionalActsOn = false.obs;
  final RxList<IntentionalAct> intentionalActs = <IntentionalAct>[].obs;

  void toggleIntentionalActs() => isIntentionalActsOn.toggle();

  Future<void> fetchIntentionalActs() async {
    try {
      isLoadingIntentionalActs.value = true;
      final token = TokenDatasource.getToken();
      if (token == null) {
        EasyLoading.showError('Authentication token not found');
        return;
      }

      final response = await http.get(
        Uri.parse(ApiUrl.intetionalAct),
        headers: {'Accept': 'application/json', 'Authorization': token},
      );

      if (response.statusCode == 200) {
        final responseData = IntentionalActsResponse.fromJson(
          json.decode(response.body),
        );
        intentionalActs.value = responseData.data;
      } else {
        EasyLoading.showError('Failed to fetch intentional acts');
      }
    } catch (e) {
      print('Error fetching intentional acts: $e');
      EasyLoading.showError(
        'An error occurred while fetching intentional acts',
      );
    } finally {
      isLoadingIntentionalActs.value = false;
    }
  }

  void refreshIntentionalActs() {
    isIntentionalActsOn.value = true;
    fetchIntentionalActs();
  }
}
