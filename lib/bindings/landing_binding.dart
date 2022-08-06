import 'package:get/get.dart';
import 'package:peternakan_sapi/controllers/money_manager_controller.dart';
import 'package:peternakan_sapi/controllers/setting_controller.dart';

import '../controllers/home_controller.dart';
import '../controllers/landing_page_controller.dart';
import '../controllers/list_cow_controller.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LandingPageController());
    Get.put(ListCowController());
    Get.put(SettingController());
    Get.put(HomeController());
    Get.put(MoneyManagerController());
  }
}
