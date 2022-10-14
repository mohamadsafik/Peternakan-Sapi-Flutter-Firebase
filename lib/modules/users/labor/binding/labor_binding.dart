import 'package:get/get.dart';

import '../controller/labor_controller.dart';

class LaborBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LaborController());
  }
}
