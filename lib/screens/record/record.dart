import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'controller/record_controller.dart';

//menggunakan getxview
class AddTaskPage extends GetView<RecordController> {
  AddTaskPage({Key? key, this.data, this.docID}) : super(key: key);

  var data = Get.arguments;
  var docID = Get.arguments;
  var items = ['Jantan', 'Betina'].obs;
  var aksi = [
    'Inseminasi Buatan',
    'Vaksin',
    'Sakit',
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          data['name'],
        )),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextField(
                readOnly: true,
                controller: controller.name,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Aksi apa",
                  suffixIcon: PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      controller.name.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return aksi.map<PopupMenuItem<String>>((String value) {
                        return PopupMenuItem(child: Text(value), value: value);
                      }).toList();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              StreamBuilder<Object>(
                  stream: controller.selectedDate.stream,
                  builder: (context, snapshot) {
                    return TextField(
                      readOnly: true,
                      controller: controller.eartag
                        ..text = DateFormat("dd-MM-yyyy")
                            .format(controller.selectedDate.value)
                            .toString(),
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(),
                        labelText: "Tanggal melakukan aksi",
                      ),
                      onTap: () {
                        controller.chooseDate;
                      },
                    );
                  }),
              const SizedBox(height: 10),
              TextField(
                controller: controller.note,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Catatan",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => controller.recordCow(
                  controller.name.text,
                  controller.eartag.text,
                  controller.note.text,
                  controller.time.text,
                  docID,
                  data.toString(),
                ),
                child: const Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
