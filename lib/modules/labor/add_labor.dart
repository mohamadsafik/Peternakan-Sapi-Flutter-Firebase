import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';

import '../../controllers/labor_controller.dart';

class AddLaborPage extends GetView<LaborController> {
  const AddLaborPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: green,
        title: Text('Tambah Pekerja'),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            TextField(
              controller: controller.username,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Nama Peternakan"),
            ),
            const SizedBox(
              height: 15,
            ),

            TextField(
              controller: controller.email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Email"),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              obscureText: true,
              controller: controller.password,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Password"),
            ),
            const SizedBox(
              height: 20,
            ),
            //button register if user null in firebase auth return dialog

            GestureDetector(
              onTap: () {
                controller.registerLabor(
                  controller.email.text,
                  controller.password.text,
                  controller.username.text,
                );
              },
              child: Container(
                width: 380,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: green,
                ),
                child: const Center(
                    child: Text(
                  'Daftar',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
