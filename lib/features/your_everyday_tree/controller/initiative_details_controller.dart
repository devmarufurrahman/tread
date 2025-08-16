import 'package:get/get.dart';
import 'package:tread256/features/your_everyday_tree/api_services/initiative_details_service.dart';
import 'package:tread256/features/your_everyday_tree/models/initiative_details_model.dart';

class InitiativeDetailsController extends GetxController {
  final RxBool isLoading = false.obs;
  final Rx<InitiativeDetailsData?> initiativeDetails =
      Rx<InitiativeDetailsData?>(null);
  final RxString errorMessage = ''.obs;

  Future<void> fetchInitiativeDetails(String initiativeId) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await InitiativeDetailsService.getInitiativeDetails(
        initiativeId,
      );
      initiativeDetails.value = response.data;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void clearData() {
    initiativeDetails.value = null;
    errorMessage.value = '';
  }
}
