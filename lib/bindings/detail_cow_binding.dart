import 'package:get/get.dart';

import '../controllers/detail_cow_controller.dart';

class DetailCowBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailCowController());
  }
}
