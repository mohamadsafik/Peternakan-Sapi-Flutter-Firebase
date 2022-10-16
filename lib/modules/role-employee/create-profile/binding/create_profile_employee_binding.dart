import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/role-employee/create-profile/controller/create_profile_employee_controller.dart';

class CreateProfileEmployeeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CreateProfileEmployeeController());
  }
}
