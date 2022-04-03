import 'package:get/get.dart';
import 'package:peternakan_sapi/controllers/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
