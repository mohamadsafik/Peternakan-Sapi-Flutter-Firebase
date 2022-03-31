import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/screens/weigt_prediction/weigth_prediction_controller.dart';

// Define a custom Form widget.
// ignore: must_be_immutable
class WeightPredictionPage extends GetView<WeightPredictionController> {
  WeightPredictionPage({Key? key, this.data}) : super(key: key);
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['name']),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Keturunan Dari",
                ),
                onChanged: (value) {
                  if (value.isEmpty) {
                    () => controller.firstFieldValue = 0;
                  } else {
                    () {
                      controller.firstFieldValue = double.parse(value);
                    };
                  }
                },
              ),
              const SizedBox(height: 10),
              TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Keturunan Dari",
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      () => controller.secondFieldValue = 0;
                    } else {
                      () {
                        controller.secondFieldValue = double.parse(value);
                      };
                    }
                  }),
              // TextField(onChanged: (value) {
              //   if (value.isEmpty) {
              //    (() => thirdFieldValue = 0);
              //   } else {
              //    (() {
              //       thirdFieldValue = double.parse(value);
              //     });
              //   }
              // }),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 40,
                width: 180,
                color: Colors.green,
                child: TextField(
                  readOnly: true,
                  controller: controller.weight
                    ..text =
                        ("${((controller.firstFieldValue * controller.firstFieldValue) * (controller.secondFieldValue) / 300) * 0.453592}")
                            .toString(),
                ),
              ),
              ElevatedButton(
                  onPressed: () =>
                      controller.editCow(controller.weight.text, data.id),
                  child: const Text('save'))
              // ElevatedButton(
              //   onPressed: () async {
              //     showDialog(
              //       context: context,
              //       builder: (context) => AlertDialog(
              //         content: Center(
              //             child: Container(
              //           height: 30,
              //           width: 30,
              //         )),
              //       ),
              //     );
              //   },
              //   child: Text("Default Alert Dialog"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
