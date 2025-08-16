import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';

mixin MixinIntentionCompleted {
  final token = TokenDatasource.getToken();
  Future<void> intentionCompleted({required String seletedIntentionId}) async {
    try {
      EasyLoading.show(status: "Loading");

      final response = await http.patch(
        Uri.parse(
          "https://tread-test-server.onrender.com/intentions/completed-Action/$seletedIntentionId",
        ),
        headers: {'Accept': 'application/json', 'Authorization': token ?? ""},
      );

      if (response.statusCode == 200) {
        EasyLoading.showSuccess("Completed successfully!");
      } else {
        EasyLoading.showError("Failed to complete intention");
      }
    } catch (e) {
      EasyLoading.showError("$e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
