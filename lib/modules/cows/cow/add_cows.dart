import 'dart:io';

import 'package:flutter/material.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/models/cow.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/add_cow_controller.dart';

//menggunakan getxview
class AddCowsPage extends StatelessWidget {
  AddCowsPage({Key? key, data}) : super(key: key);
  var data = Get.arguments;
  final controller = Get.find<AddCowController>();
  final bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: green,
          title: const Center(child: Text('Tambah Sapi')),
          actions: [
            IconButton(
              onPressed: () => controller.addCowModel(
                  CowModel(
                      name: controller.name.text,
                      nomortag: controller.nomortag.text,
                      rasCow: controller.rasCow.text,
                      gender: controller.gender.text,
                      breed: controller.breed.text,
                      birthdate: controller.birthdate.text,
                      joinedwhen: controller.joinedwhen.text,
                      note: controller.note.text),
                  controller.weight.text,
                  child: const Text('simpan sapi')),
              icon: const Icon(Icons.add_box),
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    controller.getImage();
                  },
                  child: GetBuilder<AddCowController>(
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
              const SizedBox(height: 10),
              TextField(
                controller: controller.name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nama",
                    errorText: _validate ? "data kosong" : null),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.nomortag,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nomor Tag",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                readOnly: true,
                controller: controller.rasCow,
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
                        return PopupMenuItem(
                            height: kMinInteractiveDimension,
                            child: Text(value),
                            value: value);
                      }).toList();
                    },
                  ),
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
              (data != null)
                  ? Column(
                      children: [
                        TextField(
                          readOnly: true,
                          controller: controller.breed..text = data['name'],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Keturunan Dari",
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: controller.weight..text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Bobot Lahir *KG",
                          ),
                        )
                      ],
                    )
                  : TextField(
                      controller: controller.breed,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Keturunan Dari",
                      ),
                    ),
              const SizedBox(height: 10),
              Obx(() => TextField(
                    readOnly: true,
                    controller: controller.birthdate
                      ..text = DateFormat(controller.dateformat)
                          .format(controller.selectedDate.value)
                          .toString(),
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.date_range),
                      border: OutlineInputBorder(),
                      labelText: "Tanggal Lahir",
                    ),
                    onTap: () {
                      controller.chooseDate;
                    },
                  )),
              const SizedBox(height: 10),
              Obx(() => TextField(
                    readOnly: true,
                    controller: controller.joinedwhen
                      ..text = DateFormat(controller.dateformat)
                          .format(controller.dateJoin.value)
                          .toString(),
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.date_range),
                      border: OutlineInputBorder(),
                      labelText: "Masuk Kandang Tanggal",
                    ),
                    onTap: () {
                      controller.choosejoin;
                    },
                  )),
              const SizedBox(height: 10),
              TextField(
                controller: controller.note,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Catatan Tambahan",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      // persistentFooterButtons: [
      //   Center(
      //       child: SizedBox(
      //           height: 50,
      //           width: 240,
      //           child: ElevatedButton(
      //             onPressed: () => controller.addCowModel(
      //                 CowModel(
      //                     name: controller.name.text,
      //                     rasCow: controller.rasCow.text,
      //                     gender: controller.gender.text,
      //                     breed: controller.breed.text,
      //                     birthdate: controller.birthdate.text,
      //                     joinedwhen: controller.joinedwhen.text,
      //                     note: controller.note.text),
      //                 child: const Text('simpan sapi')),
      //             child: null,
      //           )))
      // ],
    );
  }
}

//   