import 'package:get/get.dart';

import '../controller/list_cow_controller.dart';


class ListCowBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ListCowController());
  }
}
