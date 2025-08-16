import 'package:get/get.dart';
import 'package:tread256/features/auth/controler/create_account_controller.dart';
import 'package:tread256/features/auth/screen/add_organizations.dart';
import 'package:tread256/features/auth/screen/create_account.dart';
import 'package:tread256/features/auth/screen/forgot_password.dart';
import 'package:tread256/features/auth/screen/login_screen.dart';
import 'package:tread256/features/bottom_navbar/screen/bottom_navbar_screen.dart';
import 'package:tread256/features/inspiration/screen/nspiration.dart';
import 'package:tread256/features/profile/seeds_app.dart';
import 'package:tread256/features/profile/profile_screen.dart';
import 'package:tread256/features/splash_screen/screen/fill_your_canopies.dart';
import 'package:tread256/features/splash_screen/screen/splash_screen.dart';
import 'package:tread256/features/splash_screen/screen/splash_welcome.dart';
import 'package:tread256/features/splash_screen/screen/watch_your_orchard_grow.dart';
import 'package:tread256/features/splash_screen/screen/your_community_tree.dart';
import 'package:tread256/features/splash_screen/screen/your_personal_tree.dart';
import 'package:tread256/features/splash_screen/screen/your_treesof_influence.dart';
import 'package:tread256/features/your_community_tree/screen/your_community_tree.dart';
import '../features/splash_screen/screen/plant_purpose_grow_impact.dart';
import '../features/your_everyday_tree/screen/your_everyday_tree.dart';
import '../features/profile/screen/frequently_asked_questions.dart';
import '../features/your_community_tree/screen/donation.dart';
import '../features/profile/screen/privacy_security_screen.dart';

class AppRoute {
  // Route names as constants
  static const String _splashScreen = "/splashScreen";
  static const String _splashWelcomeScreen = "/splashWelcomeScreen";
  static const String _fillYourCanopiesScreen = "/fillYourCanopiesScreen";
  static const String _watchYourOrchardGrow = "/watchYourOrchardGrow";
  static const String _plantPurposeGrowImpact = "/plantPurposeGrowImpact";
  static const String _yourTreesOfInfluence = "/yourTreesOfInfluence";
  static const String _yourPersonalTree = "/yourPersonalTree";
  static const String _yourEverydayTree = "/yourEverydayTree";
  static const String _yourCommunityTree = "/yourCommunityTree";
  static const String _welcomeSplashScreen = "/welcomeSplashScreen";
  static const String _loginScreen = "/loginScreen";
  static const String _nspirationScreen = "/nspirationScreen";
  static const String _updateProfileScreen = "/updateProfileScreen";
  static const String _createAccountScreen = "/createAccountScreen";
  static const String _forgotPasswordScreen = "/forgotPasswordScreen";

  static const String _addOrganizationsScreen = "/addOrganizationsScreen";
  static const String _profileScreen = "/profileScreen";
  static const String _seedsAppScreen = "/seedsAppScreen";
  static const String _frequentlyAskedQuestionsScreen =
      "/frequentlyAskedQuestionsScreen";
  static const String _yourCommunityTreeScreen = "/yourCommunityTreeScreen";
  static const String _donationScreen = "/donationScreen";
  static const String _privacySecurityScreen = "/privacySecurityScreen";

  static const String _bottomNavbarScreen = "/bottomNavbarScreen";

  // Getter methods for route names
  static String getSplashScreen() => _splashScreen;

  static String getSplashWelcomeScreen() => _splashWelcomeScreen;
  static String getFillYourCanopiesScreen() => _fillYourCanopiesScreen;
  static String getWatchYourOrchardGrow() => _watchYourOrchardGrow;
  static String getPlantPurposeGrowImpact() => _plantPurposeGrowImpact;
  static String getYourTreesOfInfluence() => _yourTreesOfInfluence;
  static String getYourPersonalTree() => _yourPersonalTree;
  static String getYourEverydayTree() => _yourEverydayTree;
  static String getYourCommunityTree() => _yourCommunityTree;
  static String getWelcomeSplashScreen() => _welcomeSplashScreen;
  static String getLoginScreen() => _loginScreen;
  static String getCreateAccountScreen() => _createAccountScreen;
  static String getForgotPasswordScreen() => _forgotPasswordScreen;

  static String getAddOrganizationsScreen() => _addOrganizationsScreen;
  static String getProfileScreen() => _profileScreen;
  static String getNspirationScreen() => _nspirationScreen;
  static String getUpdateProfileScreen() => _updateProfileScreen;
  static String getSeedsAppScreen() => _seedsAppScreen;
  static String getFrequentlyAskedQuestionsScreen() =>
      _frequentlyAskedQuestionsScreen;
  static String getYourCommunityTreeScreen() => _yourCommunityTreeScreen;
  static String getDonationScreen() => _donationScreen;
  static String getPrivacySecurityScreen() => _privacySecurityScreen;
  static String getBottomNavbarScreen() => _bottomNavbarScreen;

  // Define routes for GetX navigation
  static List<GetPage> routes = [
    GetPage(name: _splashScreen, page: () => SplashScreen()),
    GetPage(name: _splashWelcomeScreen, page: () => SplashWelcome()),
    GetPage(name: _bottomNavbarScreen, page: () => BottomNavbarScreen()),
    GetPage(
      name: _fillYourCanopiesScreen,
      page: () => FillYourCanopiesScreen(),
    ),
    GetPage(name: _watchYourOrchardGrow, page: () => WatchYourOrchardGrow()),
    GetPage(
      name: _plantPurposeGrowImpact,
      page: () => PlantPurposeGrowImpact(),
    ),
    GetPage(name: _yourTreesOfInfluence, page: () => YourTreesOfInfluence()),
    GetPage(name: _yourPersonalTree, page: () => YourPersonalTree()),
    GetPage(name: _yourEverydayTree, page: () => YourEverydayTreeScreen()),
    GetPage(name: _yourCommunityTree, page: () => YourCommunityTree()),
    GetPage(name: _yourTreesOfInfluence, page: () => YourTreesOfInfluence()),
    GetPage(name: _loginScreen, page: () => LoginScreen()),
    GetPage(
      name: _createAccountScreen,
      page: () => CreateAccountScreen(),
      binding: BindingsBuilder(() {
        Get.put(CreateAccountController());
      }),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      transition: Transition.fadeIn, // Optional: Add transition animation
    ),

    GetPage(
      name: _addOrganizationsScreen,
      page: () => AddOrganizationsScreen(),
      transition: Transition.fadeIn, // Optional: Add transition animation
    ),
    GetPage(
      name: _profileScreen,
      page: () => ProfileScreen(),
      transition: Transition.fadeIn, // Optional: Add transition animation
    ),
    GetPage(
      name: _nspirationScreen,
      page: () => Nspiration(),
      transition: Transition.fadeIn, // Optional: Add transition animation
    ),
    // GetPage(
    //   name: _updateProfileScreen,
    //   page: () => UpdateProfile(),
    //   transition: Transition.fadeIn, // Optional: Add transition animation
    // ),
    GetPage(
      name: _seedsAppScreen,
      page: () => SeedsApp(),
      transition: Transition.fadeIn, // Optional: Add transition animation
    ),
    GetPage(
      name: _frequentlyAskedQuestionsScreen,
      page: () => FrequentlyAskedQuestions(),
      transition: Transition.fadeIn, // Optional: Add transition animation
    ),
    GetPage(
      name: _yourCommunityTreeScreen,
      page: () => const YourCommunityTreeScreen(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: _donationScreen,
      page: () => Donation(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _privacySecurityScreen,
      page: () => PrivacySecurityScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
