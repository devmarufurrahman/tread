import 'package:get/get.dart';
import 'package:tread256/features/your_everyday_tree/api_services/everyday_tree_api.dart';

class YourEverydayTreeController extends GetxController {
  var initiatives = 0.obs;
  var people_impacted = 0.obs;
  var hours_volunteered = 0.obs;
  var reachOverPeople = 0.obs;

  @override
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchData(String date) async {
    // hours calculate
    final hours = await EverydayTreeApi().fetchTotalHours(date);
    hours_volunteered.value = (hours ?? 0).toInt();

    // initiatives calculate
    final initiative = await EverydayTreeApi().fetchTotalInitiatives(date);
    initiatives.value = initiative ?? 0;

    // people impacted calculate
    final peopleData = await EverydayTreeApi().fetchPeopleImpacted();
    if (peopleData != null && peopleData.isNotEmpty) {
      final reachedOverPeopleMap = peopleData.firstWhere(
        (element) => element.containsKey('reachedOverPeople'),
        orElse: () => {'reachedOverPeople': 0},
      );
      final peopleImpactedMap = peopleData.firstWhere(
        (element) => element.containsKey('peopleImpacted'),
        orElse: () => {'peopleImpacted': 0},
      );
      reachOverPeople.value = reachedOverPeopleMap['reachedOverPeople'] ?? 0;
      people_impacted.value = peopleImpactedMap['peopleImpacted'] ?? 0;
    } else {
      reachOverPeople.value = 0;
      people_impacted.value = 0;
    }
  }
}
