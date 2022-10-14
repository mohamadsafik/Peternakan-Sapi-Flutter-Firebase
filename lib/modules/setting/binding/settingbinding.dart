import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/setting/controller/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingController());
  }
}
