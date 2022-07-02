import 'package:get/get.dart';

import '../controllers/list_event_controller.dart';

class ListEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ListEventController());
  }
}
