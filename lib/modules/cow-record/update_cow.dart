import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/models/cow.dart';
import '../../controllers/update_cow_controller.dart';

// ignore: must_be_immutable
class UpdateCowsPage extends StatelessWidget {
  UpdateCowsPage({Key? key, data}) : super(key: key);
  final controller = Get.find<UpdateCowController>();
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: green,
        title: const Center(child: Text('Edit Sapi')),
        actions: [
          IconButton(
            onPressed: () => controller.editCow(
              CowModel(
                  name: controller.name.text,
                  rasCow: controller.rasCow.text,
                  gender: controller.gender.text,
                  breed: controller.breed.text,
                  birthdate: controller.birthdate.text,
                  joinedwhen: controller.joinedwhen.text,
                  note: controller.note.text),
              data.id,
            ),
            icon: const Icon(Icons.add_box),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextField(
                controller: controller.name..text = data['name'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nama",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.nomortag..text = data['nomortag'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nomor Tag",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                readOnly: true,
                controller: controller.rasCow..text = data['rasCow'],
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Ras Sapi",
                  suffixIcon: PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      controller.rasCow.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return controller.ras
                          .map<PopupMenuItem<String>>((String value) {
                        return PopupMenuItem(child: Text(value), value: value);
                      }).toList();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.gender..text = data['gender'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Jenis Kelamin",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.breed..text = data['breed'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Keturunan Dari",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.birthdate..text = data['birthdate'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Tanggal Lahir",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.joinedwhen..text = data['joinedwhen'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Bergabung Pada Tanggal",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.note..text = data['note'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Catatan Tambahan",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    controller.getImage();
                  },
                  child: GetBuilder<UpdateCowController>(
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
                                child: const Text('Hapus'),
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
              // ElevatedButton(
              //   onPressed: () => controller.editCow(
              //     CowModel(
              //         name: controller.name.text,
              //         rasCow: controller.rasCow.text,
              //         gender: controller.gender.text,
              //         breed: controller.breed.text,
              //         birthdate: controller.birthdate.text,
              //         joinedwhen: controller.joinedwhen.text,
              //         note: controller.note.text),
              //     data.id,
              //   ),
              //   child: const Text("Tambah Sapi"),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
