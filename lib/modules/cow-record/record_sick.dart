import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:peternakan_sapi/constants/color.dart';
import '../../controllers/record_controller.dart';

//menggunakan getxview
// ignore: must_be_immutable
class SickRecordPage extends StatelessWidget {
  SickRecordPage({Key? key, this.data, this.docID}) : super(key: key);
  final controller = Get.put(RecordController());
  var data = Get.arguments;
  var docID = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: Text(
          'Sakit',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextField(
                readOnly: true,
                controller: controller.action..text = 'Sakit',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              StreamBuilder<Object>(
                  stream: controller.selectedDate.stream,
                  builder: (context, snapshot) {
                    return TextField(
                      readOnly: true,
                      controller: controller.date
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
                controller: controller.diagnosis..text = '',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Diagnosa Sakit",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.note..text = '',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Catatan",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.doctor..text = '',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nama Dokter/Mantri",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => controller.recordSakit(
                  controller.action.text,
                  controller.diagnosis.text,
                  controller.date.text,
                  controller.doctor.text,
                  controller.note.text,
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
