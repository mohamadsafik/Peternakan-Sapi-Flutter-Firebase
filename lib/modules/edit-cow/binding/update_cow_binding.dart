import 'package:get/get.dart';

import '../controller/update_cow_controller.dart';

class UpdateCowBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UpdateCowController());
  }
}
