import 'package:get/get.dart';
import 'package:peternakan_sapi/controllers/money_manager_controller.dart';

class MoneyManagerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MoneyManagerController());
  }
}
