import 'package:get/get.dart';
import 'package:peternakan_sapi/controllers/update_cow_controller.dart';
import '../controllers/add_cow_controller.dart';

class BindingsController implements Bindings {
  @override
  void dependencies() {
    Get.put(AddCowController());
    Get.put(UpdateCowController());
  }
}
