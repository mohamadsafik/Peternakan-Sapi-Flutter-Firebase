import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/labor/controller/labor_controller.dart';

class AddLaborPage extends GetView<LaborController> {
  const AddLaborPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: controller.email,
          ),
          TextField(
            controller: controller.password,
          ),
          ElevatedButton(
              onPressed: () {
                controller.registerLabor(
                    controller.email.text, controller.password.text);
              },
              child: const Text('save'))
        ],
      ),
    );
  }
}
