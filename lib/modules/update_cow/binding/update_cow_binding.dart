import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/update_cow/controller/update_cow_controller.dart';

class UpdateCowBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UpdateCowController());
  }
}
