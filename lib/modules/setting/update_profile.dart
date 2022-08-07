import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/controllers/setting_controller.dart';

class UpdateProfilePage extends StatelessWidget {
  UpdateProfilePage({Key? key, data}) : super(key: key);
  final controller = Get.find<SettingController>();
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: green,
        title: Text('Edit Profile'),
      ),
      body: Padding(
        // padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  controller.getImage();
                },
                child: GetBuilder<SettingController>(
                  builder: (c) => controller.pickedImage != null
                      ? Column(
                          children: [
                            Container(
                              height: 200,
                              width: 400,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(
                                        File(controller.pickedImage!.path),
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.cancelImage();
                              },
                              child: Icon(Icons.cancel),
                            ),
                          ],
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50)),
                          width: 100,
                          height: 100,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
              ),
            ),
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
              readOnly: true,
              controller: controller.gender,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Jenis Kelamnin",
                suffixIcon: PopupMenuButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  onSelected: (String value) {
                    controller.gender.text = value;
                  },
                  itemBuilder: (BuildContext context) {
                    return controller.items
                        .map<PopupMenuItem<String>>((String value) {
                      return PopupMenuItem(child: Text(value), value: value);
                    }).toList();
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.alamat,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Alamat",
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
      ),
    );
  }
}
