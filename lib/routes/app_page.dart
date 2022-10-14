import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/cows/cow/binding/add_cow_binding.dart';
import 'package:peternakan_sapi/modules/money_manager/binding/add_money_binding.dart';
import 'package:peternakan_sapi/modules/auth/binding/auth_binding.dart';
import 'package:peternakan_sapi/modules/employee/create-profile/binding/create_profile_employee_binding.dart';
import 'package:peternakan_sapi/modules/cows/detail_cow/binding/detail_cow_binding.dart';
import 'package:peternakan_sapi/modules/employee/listcow/binding/list_cow_employee_binding.dart';
import 'package:peternakan_sapi/modules/users/labor/binding/labor_binding.dart';
import 'package:peternakan_sapi/modules/social_media/binding/social_media_binding.dart';
import 'package:peternakan_sapi/modules/employee/create-profile/view/create_profile_employee.dart';
import 'package:peternakan_sapi/modules/employee/listcow/view/list_cow_employee.dart';
import 'package:peternakan_sapi/modules/landing/view/landing.dart';
import 'package:peternakan_sapi/modules/cows/list_cow/binding/list_cow_binding.dart';
import 'package:peternakan_sapi/modules/cows/list_record/binding/list_event_binding.dart';
import 'package:peternakan_sapi/modules/money_manager/view/add_money.dart';
import 'package:peternakan_sapi/modules/money_manager/view/money_manager.dart';
import 'package:peternakan_sapi/modules/setting/view/setting.dart';
import 'package:peternakan_sapi/modules/cows/cow/binding/update_cow_binding.dart';
import 'package:peternakan_sapi/modules/setting/view/update_profile.dart';
import 'package:peternakan_sapi/modules/social_media/view/social_media_beranda.dart';
import 'package:peternakan_sapi/routes/route_name.dart';
import '../modules/cows/list_record/view/list_event.dart';
import '../modules/landing/binding/landing_binding.dart';
import '../modules/auth/view/auth_main.dart';
import '../modules/auth/view/login.dart';
import '../modules/auth/view/register.dart';
import '../modules/cows/cow/view/add_cows.dart';
import '../modules/cows/detail_cow/view/detail_cow.dart';
import '../modules/cows/list_cow/view/list_cows.dart';
import '../modules/cows/cow/view/update_cow.dart';
import '../modules/setting/binding/settingbinding.dart';
import '../modules/users/labor/view/add_employee.dart';
import '../modules/users/labor/view/employee.dart';

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
      page: () => const AddEmployeePage(),
      binding: LaborBinding(),
    ),
    GetPage(
      name: (RouteName.employee),
      page: () => EmployeeMonitoringPage(),
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
    GetPage(
      name: (RouteName.moneymanager),
      page: () => MoneyManagerPage(),
      binding: SocialMediaBinding(),
    ),
    GetPage(
      name: (RouteName.addmoney),
      page: () => AddMoneyPage(),
      binding: AddMoneyBinding(),
    ),

    //employee
    GetPage(
      name: (RouteName.createprofile),
      page: () => CreateProfileEmployee(),
      binding: CreateProfileEmployeeBinding(),
    ),
    GetPage(
      name: (RouteName.listcowemployee),
      page: () => ListCowsEmployee(),
      binding: ListCowEmployeeBinding(),
    ),
  ];
}
