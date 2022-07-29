import 'package:get/get.dart';
import 'package:peternakan_sapi/bindings/add_cow_binding.dart';
import 'package:peternakan_sapi/bindings/auth_binding.dart';
import 'package:peternakan_sapi/bindings/detail_cow_binding.dart';
import 'package:peternakan_sapi/bindings/labor_binding.dart';
import 'package:peternakan_sapi/bindings/social_media_binding.dart';
import 'package:peternakan_sapi/modules/cow-record/add_cows.dart';
import 'package:peternakan_sapi/modules/landing/landing.dart';
import 'package:peternakan_sapi/bindings/list_cow_binding.dart';
import 'package:peternakan_sapi/bindings/list_event_binding.dart';
import 'package:peternakan_sapi/modules/setting/setting.dart';
import 'package:peternakan_sapi/bindings/update_cow_binding.dart';
import 'package:peternakan_sapi/modules/setting/update_profile.dart';
import 'package:peternakan_sapi/modules/social_media/social_media_beranda.dart';
import 'package:peternakan_sapi/routes/route_name.dart';
import 'package:peternakan_sapi/modules/cow-record/update_cow.dart';
import '../bindings/landing_binding.dart';
import '../modules/auth/auth_main.dart';
import '../modules/auth/login.dart';
import '../modules/auth/register.dart';
import '../modules/cow-record/detail_cow/detail_cow.dart';
import '../modules/cow-record/list_cow/list_cows.dart';
import '../modules/cow-record/list_event_cow/list_event.dart';
import '../modules/labor/add_labor.dart';
import '../modules/labor/labor.dart';
import '../bindings/settingbinding.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: (RouteName.authmain),
      page: () => const AuthMainPage(),
      // binding: ListCowBinding(),
    ),
    GetPage(
      name: (RouteName.listcow),
      page: () => ListCows(),
      binding: ListCowBinding(),
    ),
    GetPage(
      name: RouteName.addcow,
      page: () => AddCowsPage(),
      binding: AddCowBinding(),
    ),
    GetPage(
        name: (RouteName.updatecow),
        page: () => UpdateCowsPage(),
        binding: UpdateCowBinding()),
    GetPage(
        name: (RouteName.detailcow),
        page: () => DetailCowPage(),
        binding: DetailCowBinding()),
    GetPage(
      name: (RouteName.login),
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: (RouteName.register),
      page: () => RegisterPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: (RouteName.landing),
      page: () => LandingPage(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: (RouteName.listevent),
      page: () => ListEvent(),
      binding: ListEventBinding(),
    ),
    GetPage(
      name: (RouteName.addlabor),
      page: () => const AddLaborPage(),
      binding: LaborBinding(),
    ),
    GetPage(
      name: (RouteName.employee),
      page: () => LaborPage(),
      binding: LaborBinding(),
    ),
    GetPage(
      name: (RouteName.setting),
      page: () => SettingPage(),
      binding: SettingBinding(),
    ),
     GetPage(
      name: (RouteName.updateprofile),
      page: () => UpdateProfilePage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: (RouteName.socialmedia),
      page: () => SocialMediaPage(),
      binding: SocialMediaBinding(),
    ),
  ];
}
