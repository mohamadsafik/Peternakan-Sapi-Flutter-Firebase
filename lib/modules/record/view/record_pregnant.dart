import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:peternakan_sapi/modules/record/controller/record_controller.dart';

import '../../../constants/color.dart';


class PregnantRecordPage extends StatelessWidget {
  PregnantRecordPage({Key? key, this.data, this.docID}) : super(key: key);
  final controller = Get.put(RecordController());
  var data = Get.arguments;
  var docID = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: const Text(
          'Catat Hamil',
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
                controller: controller.action..text = 'Catat Hamil (PKB)',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                readOnly: true,
                controller: controller.status..text = 'Hamil',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Hasil Pemeriksaan",
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
                controller: controller.inseminator..text = '',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nama Pemeriksa",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                controller: controller.gestationalage..text = '',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Usia Kandungan *bulan",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.straw..text = '',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Kode Semen (straw)",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => controller.recordPregnant(
                  controller.status.text,
                  controller.action.text,
                  controller.date.text,
                  controller.straw.text,
                  controller.inseminator.text,
                  controller.gestationalage.text,
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
