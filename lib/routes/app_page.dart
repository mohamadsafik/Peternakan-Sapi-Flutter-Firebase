import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/add-cow/binding/add_cow_binding.dart';
import 'package:peternakan_sapi/modules/money_manager/binding/add_money_binding.dart';
import 'package:peternakan_sapi/modules/auth/binding/auth_binding.dart';
import 'package:peternakan_sapi/modules/role-employee/create-profile/binding/create_profile_employee_binding.dart';
import 'package:peternakan_sapi/modules/detail_cow/binding/detail_cow_binding.dart';
import 'package:peternakan_sapi/modules/role-employee/listcow/binding/list_cow_employee_binding.dart';
import 'package:peternakan_sapi/modules/employee-monitoring/binding/labor_binding.dart';
import 'package:peternakan_sapi/modules/belum_selesai/social_media/binding/social_media_binding.dart';
import 'package:peternakan_sapi/modules/role-employee/create-profile/view/create_profile_employee.dart';
import 'package:peternakan_sapi/modules/role-employee/listcow/view/list_cow_employee.dart';
import 'package:peternakan_sapi/modules/landing/view/landing.dart';
import 'package:peternakan_sapi/modules/list_cow/binding/list_cow_binding.dart';
import 'package:peternakan_sapi/modules/list_record/binding/list_event_binding.dart';
import 'package:peternakan_sapi/modules/money_manager/view/add_money.dart';
import 'package:peternakan_sapi/modules/money_manager/view/money_manager.dart';
import 'package:peternakan_sapi/modules/setting/view/setting.dart';
import 'package:peternakan_sapi/modules/edit-cow/binding/update_cow_binding.dart';
import 'package:peternakan_sapi/modules/setting/view/update_profile.dart';
import 'package:peternakan_sapi/modules/belum_selesai/social_media/view/social_media_beranda.dart';
import 'package:peternakan_sapi/modules/weight_prediction/view/weight_prediction.dart';
import 'package:peternakan_sapi/routes/route_name.dart';
import '../modules/list_record/view/list_event.dart';
import '../modules/landing/binding/landing_binding.dart';
import '../modules/auth/auth-main/view/auth_main.dart';
import '../modules/auth/login/view/login.dart';
import '../modules/auth/register/view/register.dart';
import '../modules/add-cow/view/add_cows.dart';
import '../modules/detail_cow/view/detail_cow.dart';
import '../modules/list_cow/view/list_cows.dart';
import '../modules/edit-cow/view/update_cow.dart';
import '../modules/setting/binding/settingbinding.dart';
import '../modules/employee-monitoring/view/add_employee.dart';
import '../modules/employee-monitoring/view/employee.dart';

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
    GetPage(
      name: (RouteName.weightprediction),
      page: () => WeightPredictionPage(),
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
