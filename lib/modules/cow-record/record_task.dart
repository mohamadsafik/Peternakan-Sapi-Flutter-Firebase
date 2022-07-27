import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/record_controller.dart';

//menggunakan getxview
// ignore: must_be_immutable
class AddTaskPage extends StatelessWidget {
  AddTaskPage({Key? key, this.data, this.docID}) : super(key: key);
  final controller = Get.put(RecordController());
  var data = Get.arguments;
  var docID = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          data['name'],
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextField(
                readOnly: true,
                controller: controller.action..text = '',
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Aksi apa",
                  suffixIcon: PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      controller.action.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return controller.aksi
                          .map<PopupMenuItem<String>>((String value) {
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
                controller: controller.note..text = '',
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
                  controller.action.text,
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
