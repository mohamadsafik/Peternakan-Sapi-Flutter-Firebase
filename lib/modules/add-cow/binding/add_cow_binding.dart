import 'package:get/get.dart';

import '../controller/add_cow_controller.dart';

class AddCowBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddCowController());
  }
}
