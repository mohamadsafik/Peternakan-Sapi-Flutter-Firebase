import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/add_cow/binding/add_cow_binding.dart';
import 'package:peternakan_sapi/modules/auth/binding/auth_binding.dart';
import 'package:peternakan_sapi/modules/auth/view/auth_main.dart';
import 'package:peternakan_sapi/modules/auth/view/register.dart';
import 'package:peternakan_sapi/modules/detail_cow/binding/detail_cow_binding.dart';
import 'package:peternakan_sapi/modules/labor/binding/labor_binding.dart';
import 'package:peternakan_sapi/modules/labor/view/add_labor.dart';
import 'package:peternakan_sapi/modules/landing/view/landing.dart';
import 'package:peternakan_sapi/modules/list_cow/binding/list_cow_binding.dart';
import 'package:peternakan_sapi/modules/list_cow/view/list_cows.dart';
import 'package:peternakan_sapi/modules/list_event/binding/list_event_binding.dart';
import 'package:peternakan_sapi/modules/list_event/view/list_event.dart';
import 'package:peternakan_sapi/modules/update_cow/binding/update_cow_binding.dart';
import 'package:peternakan_sapi/routes/route_name.dart';
import 'package:peternakan_sapi/modules/detail_cow/view/detail_cow.dart';
import 'package:peternakan_sapi/modules/auth/view/login.dart';
import 'package:peternakan_sapi/modules/update_cow/view/update_cow.dart';
import '../modules/add_cow/view/add_cows.dart';
import '../modules/landing/binding/landing_binding.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: (RouteName.authmain),
      page: () => AuthMainPage(),
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
  ];
}
