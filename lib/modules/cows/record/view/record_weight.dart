import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import '../../../weight_prediction/controller/weigth_prediction_controller.dart';

// ignore: must_be_immutable
class WeightRecordPage extends StatefulWidget {
  WeightRecordPage({Key? key, this.data}) : super(key: key);
  var data = Get.arguments;

  @override
  State<WeightRecordPage> createState() => _WeightRecordPageState();
}

class _WeightRecordPageState extends State<WeightRecordPage> {
  final controller = Get.put(WeightPredictionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
          backgroundColor: green,
          title: widget.data?['name'] != null
              ? Text(widget.data['name'])
              : Text('data')),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                    height: 300,
                    child: Image(
                        image: AssetImage(
                            'assets/weightprediction/metode-winter.png'))),
                const SizedBox(height: 10),
                TextField(
                  controller: controller.weight,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Masukan Berat",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 40,
                  width: 180,
                  color: Colors.green,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.editCow(
                          controller.weight.text, widget.data.id);
                    },
                    child: const Center(child: Text('submit')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
