import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/core/utils/constants/api_url.dart';
import 'package:tread256/features/perosonal_tree/screen/user_profile.dart'
    as profile;
import 'package:tread256/features/perosonal_tree/models/branch_search_model.dart';
import 'package:tread256/features/perosonal_tree/models/friend_profile_model.dart';
import 'package:tread256/core/global_search/mixin_global_search.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

mixin MixinFetchProfile on MixinGlobalSearch {
  // final RxBool isLoading = false.obs;
  final Rx<FriendProfileResponse?> friendProfile = Rx<FriendProfileResponse?>(
    null,
  );

  Future<void> fetchFriendProfile(String friendId) async {
    try {
      isLoading.value = true;
      final token = TokenDatasource.getToken();
      if (token == null) {
        EasyLoading.showError('Authentication token not found');
        return;
      }

      print('Fetching friend profile for ID: $friendId');
      final response = await http.get(
        Uri.parse(ApiUrl.fetchProfile(friendId)),
        headers: {'Accept': 'application/json', 'Authorization': token},
      );

      print('Friend Profile Response Status: ${response.statusCode}');
      print('Friend Profile Response Body: ${response.body}');

      if (response.statusCode == 200) {
        try {
          final responseData = json.decode(response.body);
          friendProfile.value = FriendProfileResponse.fromJson(responseData);
          print('Friend profile loaded successfully');
        } catch (parseError) {
          print('Error parsing friend profile response: $parseError');
          EasyLoading.showError('Error parsing friend profile data');
        }
      } else {
        print('Failed to fetch friend profile. Status: ${response.statusCode}');
        EasyLoading.showError('Failed to fetch friend profile');
      }
    } catch (e) {
      print('Exception in fetchFriendProfile: $e');
      EasyLoading.showError('An error occurred while fetching friend profile');
    } finally {
      isLoading.value = false;
    }
  }

  void selectBranch(BranchData branch, dynamic controller) {
    selectedBranchId.value = branch.friend.id;
    selectedUserId.value = branch.friend.id;
    branchNameController.text = branch.friend.profile.name;
    selectedBranchData.value = branch;
    updateCanSave();
    Get.back();
    Get.to(
      () => profile.UserProfile(
        data: {
          'name': branch.friend.profile.name,
          'imagePath': branch.friend.profile.image,
        },
      ),
    );
    fetchFriendProfile(branch.friend.id);
    branchNameController.clear();
    selectedBranchData.value = null;
    selectedBranchId.value = '';
    searchResults.clear();
    branchSearchResults.clear();
  }
}
