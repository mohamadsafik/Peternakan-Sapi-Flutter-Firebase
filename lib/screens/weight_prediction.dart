import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import '../controllers/weigth_prediction_controller.dart';

// ignore: must_be_immutable
class WeightPredictionPage extends StatefulWidget {
  WeightPredictionPage({Key? key, this.data}) : super(key: key);
  var data = Get.arguments;

  @override
  State<WeightPredictionPage> createState() => _WeightPredictionPageState();
}

class _WeightPredictionPageState extends State<WeightPredictionPage> {
  final controller = Get.put(WeightPredictionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data['name']),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "panjang",
                ),
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() => controller.firstFieldValue = 0);
                  } else {
                    controller.firstFieldValue = double.parse(value);
                  }
                },
              ),
              const SizedBox(height: 10),
              TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "lebar",
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() => controller.secondFieldValue = 0);
                    } else {
                      controller.secondFieldValue = double.parse(value);
                    }
                  }),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 40,
                width: 180,
                color: Colors.green,
                child: ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                        onConfirm: () => controller.editCow(
                            controller.weight.text, widget.data.id),
                        onCancel: () {},
                        textConfirm: "simpan",
                        content: TextField(
                          readOnly: true,
                          controller: controller.weight
                            ..text =
                                ("${((controller.firstFieldValue * controller.firstFieldValue) * (controller.secondFieldValue) / 300) * 0.453592}")
                                    .toString(),
                        ));
                  },
                  child: const Center(child: Text('submit')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
