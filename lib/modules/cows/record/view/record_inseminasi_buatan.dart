import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:peternakan_sapi/constants/color.dart';
import '../controller/record_controller.dart';

//menggunakan getxview
// ignore: must_be_immutable
class InseminasiBuatanPage extends StatelessWidget {
  InseminasiBuatanPage({Key? key, this.data, this.docID}) : super(key: key);
  final controller = Get.put(RecordController());
  var data = Get.arguments;
  var docID = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: Text(
          'Inseminasi Buatan',
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
                controller: controller.action..text = 'Inseminasi Buatan (IB)',
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
                controller: controller.inseminator..text = '',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nama Inseminator",
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
                onPressed: () => controller.recordCow(
                  controller.status.text,
                  controller.action.text,
                  controller.date.text,
                  controller.straw.text,
                  controller.inseminator.text,
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
