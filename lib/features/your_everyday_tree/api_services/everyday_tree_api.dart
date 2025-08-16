import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/core/utils/constants/api_url.dart';
import 'package:tread256/features/your_everyday_tree/models/progress_overview_model.dart';

class EverydayTreeApi {
  Future<double?> fetchTotalHours(String date) async {
    try {
      final url = Uri.parse('${ApiUrl.getInitiativeHour}$date');
      final headers = {'Authorization': '${TokenDatasource.getToken()}'};
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true && data['data'] != null) {
          return data['data']['totalHours'] as double;
        }
      }
      return null;
    } catch (e) {
      print('Error fetching total hours: $e');
      return null;
    }
  }

  Future<int?> fetchTotalInitiatives(String date) async {
    try {
      final url = Uri.parse('${ApiUrl.getInitiativeComplete}$date');
      final headers = {'Authorization': '${TokenDatasource.getToken()}'};
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true && data['data'] != null) {
          return data['data']['totalCompleteInitiativesCount'] as int;
        }
      }
      return null;
    } catch (e) {
      print('Error fetching total hours: $e');
      return null;
    }
  }

  Future<List?> fetchPeopleImpacted() async {
    try {
      final url = Uri.parse(ApiUrl.getPeopleImpact);
      final headers = {'Authorization': '${TokenDatasource.getToken()}'};
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true && data['data'] != null) {
          int overReach = data['data']['reachedOverPeople'] as int;
          int peopleImpacted = data['data']['peopleImpacted'] as int;
          List<Map<String, int>> result = [
            {'reachedOverPeople': overReach},
            {'peopleImpacted': peopleImpacted},
          ];
          return result;
        }
      }
      return null;
    } catch (e) {
      print('Error fetching total hours: $e');
      return null;
    }
  }

  Future<ProgressOverviewResponse?> fetchProgressOverview() async {
    try {
      final url = Uri.parse(
        'https://tread-test-server.onrender.com/everyday-tree/progress-overview',
      );
      final headers = {'Authorization': '${TokenDatasource.getToken()}'};
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ProgressOverviewResponse.fromJson(data);
      }
      return null;
    } catch (e) {
      print('Error fetching progress overview: $e');
      return null;
    }
  }
}
