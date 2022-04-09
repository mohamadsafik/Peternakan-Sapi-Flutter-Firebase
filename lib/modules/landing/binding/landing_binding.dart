import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/setting_controller.dart';

import '../../list_cow/controller/list_cow_controller.dart';
import '../controller/landing_page_controller.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LandingPageController());
    Get.put(ListCowController());
    Get.put(SettingController());
  }
}
