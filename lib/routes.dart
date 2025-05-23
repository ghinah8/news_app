import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '/view/about_app_page/screen/about_app_screen.dart';
import '/view/auth/login/screen/login_screen.dart';
import '/view/auth/sign_up/screen/sign_up_screen.dart';
import '/view/book_marks/screen/bookmarks_screen.dart';
import '/view/country_page/screen/country_page.dart';
import '/view/home_page/home_screen/home_screen.dart';
import '/view/interests_page/Screen/interests_page.dart';
import '/view/news_page/news_page_sceen/news_screen.dart';
import '/view/notification/view/notifications_screen.dart';
import '/view/profile_page/change_password/screen/change_password.dart';
import '/view/profile_page/delete_account/screen/delete_account.dart';
import '/view/profile_page/edit_profile/screen/Edit_profile.dart';
import '/view/profile_page/profile/screen/profile_page.dart';
import '/view/search_page/view/search_screen.dart';
import '/view/setting_page/Warnings/screen/warning.dart';
import '/view/setting_page/seitting/screen/setting.dart';
import '/view/setting_page/setting/screen/setting.dart';
import '/view/sources_page/screen/news_source_screen.dart';
import '/view/splash_screen/screen/splash_screen.dart';
import '/view/surveys_page/screen/surveys_screen.dart';

class Routes {
  static const String profile = '/profile';
  static const String editProfile = '/editProfile';
  static const String changePassword = '/changePassword';
  static const String deleteAccount = '/deleteAccount';
  static const String splash_screen = '/splash_screen';
  static const String sign_up_screen = '/sign_up_screen';
  static const String log_in_screen = '/log_in_screen';
  static const String surveys_screen = '/surveys_screen';
  static const String search_screen = '/search_screen';
  static const String notifications_screen = '/notifications_screen';
  static const String country_page = '/country_page';
  static const String interests_page = '/interests_page';
  static const String home_page = '/home_page';
  static const String news_screen = '/news_screen';
  static const String source = '/source';
  static const String setting = '/setting';
  static const String setting_tow = '/setting_tow';
  static const String warning = '/warning';
  static const String about_app_screen = '/about_app_screen';

  static final List<GetPage> pages = [
    GetPage(name: '/profile', page: () => const ProfilePage()),
    GetPage(name: '/editProfile', page: () => const EditProfile()),
    GetPage(name: '/changePassword', page: () => const ChangePassword()),
    GetPage(name: '/splash_screen', page: () => const SplashScreen()),
    GetPage(name: '/sign_up_screen', page: () => const SignUpScreen()),
    GetPage(name: '/log_in_screen', page: () => const LogInScreen()),
    GetPage(name: '/surveys_screen', page: () => const SurveysScreen()),
    GetPage(
      name: '/deleteAccount',
      page: () => const DeleteAccount(),
    ),
    GetPage(
      name: '/search_screen',
      page: () => SearchScreen(),
    ),
    GetPage(
      name: '/notifications_screen',
      page: () => NotificationsScreen(),
    ),
    GetPage(
      name: '/country_page',
      page: () => CountryPage(),
    ),
    GetPage(
      name: '/interests_page',
      page: () => InterestsPage(),
    ),
    GetPage(
      name: '/home_page',
      page: () => HomePage(),
    ),
    GetPage(
      name: '/news_screen',
      page: () => NewsScreen(),
    ),
    GetPage(
      name: '/source',
      page: () => NewsSourceScreen(),
    ),
    GetPage(
      name: '/setting',
      page: () => Setting(),
    ),
    GetPage(
      name: '/setting_tow',
      page: () => SettingTow(),
    ),
    GetPage(
      name: '/warning',
      page: () => Warning(),
    ),
    GetPage(
      name: '/about_app_screen',
      page: () => AboutAppScreen(),
    ),
    GetPage(
      name: '/book_marks_screen',
      page: () => BookmarksScreen(),
    ),
  ];
}
