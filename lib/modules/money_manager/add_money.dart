import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants/color.dart';
import '../../controllers/money_manager_controller.dart';

class AddMoneyPage extends StatelessWidget {
  AddMoneyPage({Key? key}) : super(key: key);
  final controller = Get.find<MoneyManagerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: Text(
          '',
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
                controller: controller.note..text = '',
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Aksi apa",
                  suffixIcon: PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      controller.note.text = value;
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
                      controller: controller.date
                        ..text = DateFormat("dd-MM-yyyy")
                            .format(controller.selectedDate.value)
                            .toString(),
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(),
                        labelText: "Tanggal",
                      ),
                      onTap: () {
                        controller.chooseDate;
                      },
                    );
                  }),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                controller: controller.total..text = '',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Jumlah Rupiah",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.action..text = '',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Untuk apa",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => controller.addmoney(
                    controller.action.text,
                    controller.date.text,
                    controller.note.text,
                    controller.total.text),
                child: const Text("Simpan"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
