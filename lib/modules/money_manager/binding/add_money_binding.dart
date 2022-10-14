import 'package:get/get.dart';

import '../controller/money_manager_controller.dart';

class AddMoneyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MoneyManagerController());
  }
}
