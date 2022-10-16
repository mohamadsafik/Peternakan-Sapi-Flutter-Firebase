import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/role-employee/listcow/controller/list_cow_employee_controller.dart';

class ListCowEmployeeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListCowEmployeeController());
  }
}
