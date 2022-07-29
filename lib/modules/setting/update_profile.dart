import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/controllers/setting_controller.dart';

class UpdateProfilePage extends StatelessWidget {
  UpdateProfilePage({Key? key, data}) : super(key: key);
  final controller = Get.find<SettingController>();
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['email']),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          TextField(
            controller: controller.username..text = data['username'],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Nama",
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller.gender,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Jenis",
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller.alamat,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Jenis Kelamin",
            ),
          ),
          ElevatedButton(
              onPressed: () {
                controller.updateProfile(controller.username.text,
                    controller.alamat.text, controller.gender.text, data.id);
              },
              child: Text('update'))
        ],
      ),
    );
  }
}
