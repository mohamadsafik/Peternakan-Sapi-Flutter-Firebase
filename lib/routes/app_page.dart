import 'package:get/get.dart';
import 'package:peternakan_sapi/bindings/auth_binding.dart';
import 'package:peternakan_sapi/bindings/binding_controller.dart';
import 'package:peternakan_sapi/routes/route_name.dart';
import 'package:peternakan_sapi/screens/detail_cow/detail_cow.dart';
import 'package:peternakan_sapi/screens/login.dart';
import 'package:peternakan_sapi/screens/update_cow.dart';

import '../screens/add_cows.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.addcow,
      page: () => const AddCowsPage(),
      binding: BindingsController(),
    ),
    GetPage(
        name: (RouteName.updatecow),
        page: () => UpdateCowsPage(),
        binding: BindingsController()),
    GetPage(
      name: (RouteName.detailcow),
      page: () => DetailCowPage(),
      // binding: BindingsController()
    ),
    GetPage(
      name: (RouteName.login),
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
  ];
}
