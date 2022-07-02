import 'package:get/get.dart';

import '../controllers/add_cow_controller.dart';

class AddCowBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddCowController());
  }
}
