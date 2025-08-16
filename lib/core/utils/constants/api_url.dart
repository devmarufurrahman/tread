abstract class ApiUrl {
  static const String baseUrl = "https://seedsapp.org";
  static const String login = "$baseUrl/auth/login";
  static const String register = "$baseUrl/auth/register";
  static String forgetPassword(String email) =>
      "$baseUrl/auth/forget-password/$email";

  static String forgetPasswordVerify(String email) =>
      "$baseUrl/auth/forget-password/verify/$email";

  static String changePassword(String token) =>
      '$baseUrl/auth/forget-password/reset/$token';

  static String everydayTreeInitative(String token) =>
      "$baseUrl/everyday-tree/initative/$token";

  static String search(String query) => "$baseUrl/personal-tree/user/$query";

  static String addNewPerson =
      '$baseUrl/personal-tree/add-new-person-friend-list';

  static String branchSearch(String query) =>
      "$baseUrl/personal-tree/search-friend-list?name=$query";

  static String createPersonalAction =
      "$baseUrl/personal-tree/create-personal-tree-actions";

  static String completeAction(String actionId) =>
      "$baseUrl/personal-tree/complate-action/$actionId";

  static String fetchProfile(String friendId) =>
      "$baseUrl/personal-tree/friend-profile-and-trees?friendid=$friendId";
  static String intetionalAct = "$baseUrl/personal-tree/intentional-acts";
  static String actionCompleteCount =
      "$baseUrl/personal-tree/action-completed-count";

  static String leaveCount = "$baseUrl/personal-tree/show-leaves-count";

  static String postLogCreate = "$baseUrl/everyday-tree/ideas-library";

  static String postEventServe = "$baseUrl/community-tree/add-serve";
  static String getInitiativeHour =
      "$baseUrl/everyday-tree/initiatives-total-time-count?date=";

  static String getTotalFrient = "$baseUrl/personal-tree/total-friend-count";

  static String getInitiativeComplete =
      "$baseUrl/everyday-tree/initiatives-completed-count?date=";

  static String getPeopleImpact = "$baseUrl/everyday-tree/people-impacted";

  static String userData = "$baseUrl/user";
  static String userEditData = "$baseUrl/user/edit-profile";
  static String profileUpdate = "$baseUrl/user/update-profile";

  static String personalTreeAi =
      "$baseUrl/personal-tree/show-pesonal-tree-friends-ai?date=";

  static String everydayTreeAi = "$baseUrl/everyday-tree/tree-view-ai?date=";

  static String personalCalender =
      "$baseUrl/personal-tree/calendar-count-leaves?date=";
}
