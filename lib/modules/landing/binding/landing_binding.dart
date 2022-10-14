import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/money_manager/controller/money_manager_controller.dart';
import 'package:peternakan_sapi/modules/setting/controller/setting_controller.dart';

import '../../home/controller/home_controller.dart';
import '../controller/landing_page_controller.dart';
import '../../cows/list_cow/controller/list_cow_controller.dart';

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
