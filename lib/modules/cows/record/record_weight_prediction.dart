import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import '../../../controllers/weigth_prediction_controller.dart';

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
      backgroundColor: background,
      appBar: AppBar(
          backgroundColor: green,
          title: widget.data?['name'] != null
              ? Text(widget.data['name'])
              : Text('Prediksi Bobot')),
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
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Panjang Badan",
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() => controller.firstFieldValue = 0);
                    } else {
                      controller.firstFieldValue = int.parse(value);
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Lingkar Dada",
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() => controller.secondFieldValue = 0);
                      } else {
                        controller.secondFieldValue = int.parse(value);
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
                      widget.data?.id != null
                          ? Get.defaultDialog(
                              onConfirm: () => controller.editCow(
                                  controller.weight.text, widget.data.id),
                              onCancel: () {},
                              title: 'Prediksi Berat',
                              textConfirm: "simpan",
                              content: TextField(
                                readOnly: true,
                                controller: controller.weight
                                  ..text =
                                      ("${(((controller.firstFieldValue * controller.firstFieldValue) * (controller.secondFieldValue) / 300) * 0.453592).round()}"),
                              ))
                          : showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                  title: const Text(""),
                                  content: SizedBox(
                                      height: 160.0,
                                      child: Column(children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Berat Sapi : '),
                                            Text(
                                              // readOnly: true,
                                              // controller: controller.weight
                                              //   ..text =
                                              ("${(((controller.firstFieldValue * controller.firstFieldValue) * (controller.secondFieldValue) / 300) * 0.453592).round()} Kg"),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Kebutuhan Rumput : '),
                                            Text(
                                                "${(((((controller.firstFieldValue * controller.firstFieldValue) * (controller.secondFieldValue) / 300) * 0.453592) / 100) * 10).round()} Kg"),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Kebutuhan Comboran : '),
                                            Text(
                                                "${(((((controller.firstFieldValue * controller.firstFieldValue) * (controller.secondFieldValue) / 300) * 0.453592) / 100) * 2).round()} Kg"),
                                          ],
                                        ),
                                      ]))));
                      // showCupertinoModalPopup(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return Scaffold(
                      //         appBar: AppBar(
                      //           backgroundColor: green,
                      //         ),
                      //         body: Container(
                      //           height: 800,
                      //           width: 800,
                      //           decoration: BoxDecoration(
                      //               color: Colors.white,
                      //               borderRadius: BorderRadius.circular(8)),
                      //           child: Column(
                      //             children: [
                      //               Row(
                      //                 children: [
                      //                   Text('Berat Sapi : '),
                      //                   Text(
                      //                     // readOnly: true,
                      //                     // controller: controller.weight
                      //                     //   ..text =
                      //                     ("${(((controller.firstFieldValue * controller.firstFieldValue) * (controller.secondFieldValue) / 300) * 0.453592).round()}"),
                      //                   ),
                      //                 ],
                      //               ),
                      //               Row(
                      //                 children: [
                      //                   Text('Kebutuhan Rumput : '),
                      //                   Text(
                      //                       "${(((((controller.firstFieldValue * controller.firstFieldValue) * (controller.secondFieldValue) / 300) * 0.453592) / 100) * 10).round()}"),
                      //                 ],
                      //               ),
                      //               Row(
                      //                 children: [
                      //                   Text('Kebutuhan Comboran : '),
                      //                   Text(
                      //                       "${(((((controller.firstFieldValue * controller.firstFieldValue) * (controller.secondFieldValue) / 300) * 0.453592) / 100) * 2).round()}"),
                      //                 ],
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     });
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
