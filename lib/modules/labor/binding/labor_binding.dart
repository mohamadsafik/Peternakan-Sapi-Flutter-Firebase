import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/labor/controller/labor_controller.dart';

class LaborBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LaborController());
  }
}
