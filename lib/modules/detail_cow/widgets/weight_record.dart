import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/modules/add_record/view/record_weight.dart';
import 'package:peternakan_sapi/modules/weight_prediction/view/weight_prediction.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../../constants/firebase_constants.dart';
import '../../list_record/view/list_weigth.dart';

class WeightRecord extends StatelessWidget {
  const WeightRecord({Key? key, required this.data, required this.currentUser})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final data;
  final String currentUser;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: background,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => Get.to(ListWeigth()),
                          child: const Icon(
                            Icons.show_chart,
                            color: Colors.black,
                          ),
                        ),
                      )),
                  const SizedBox(width: 5),
                  Container(
                      height: 30,
                      width: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text('catatan berat',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      )),
                  const SizedBox(width: 5),
                  Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: background,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text("Berat Sapi"),
                                      content: SizedBox(
                                        height: 130.0,
                                        child: Column(
                                          children: <Widget>[
                                            //this is the button to add income

                                            Row(
                                              children: <Widget>[
                                                const Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child:
                                                      Icon(Icons.attach_money),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: MaterialButton(
                                                    onPressed: () {
                                                      Get.to(
                                                          WeightPredictionPage(
                                                              data: data));
                                                    },
                                                    child: const Text(
                                                        "Prediksi Bobot"),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                const Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child:
                                                      Icon(Icons.attach_money),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: MaterialButton(
                                                    onPressed: () {
                                                      Get.to(WeightRecordPage(
                                                          data: data));
                                                    },
                                                    child: const Text(
                                                        "Input Berat"),
                                                  ),
                                                )
                                              ],
                                            ),
                                            //    the button to add expense

                                            //    this is the button to add category
                                          ],
                                        ),
                                      ),
                                    ));
                          },
                          // => Get.to(WeightPredictionPage(data: data)),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                      ))
                ],
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('cows')
                    .where('uid', isEqualTo: currentUser)
                    .where('name', isEqualTo: data['name'])
                    .snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: streamSnapshot.data?.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (streamSnapshot.data?.docs[index] != null) {
                          final map = streamSnapshot.data?.docs[index];
                          final records = map?["weights"] as List<dynamic>;
                          records
                              .sort((a, b) => b["time"].compareTo(a["time"]));
                          return SizedBox(
                            height: 100,
                            child: SingleChildScrollView(
                              child: Column(
                                  children: records.map((record) {
                                return Card(
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.monitor_weight_outlined,
                                      color: Colors.orange,
                                    ),
                                    title: Text(
                                      record["weight"],
                                    ),
                                    trailing: IconButton(
                                        onPressed: () {
                                          void recordCow() async {
                                            DocumentReference cows = firestore
                                                .collection("cows")
                                                .doc(data.id);
                                            try {
                                              await cows.update(
                                                {
                                                  "weights":
                                                      FieldValue.arrayRemove(
                                                    [record],
                                                  )
                                                },
                                              );
                                              Get.defaultDialog(
                                                barrierDismissible: true,
                                                title: "berhasil",
                                                middleText:
                                                    "berhasil record sapi",
                                                onConfirm: () {
                                                  Get.back();
                                                },
                                                textConfirm: "okay",
                                              );
                                            } catch (e) {
                                              if (kDebugMode) {
                                                print(e);
                                              }
                                              Get.defaultDialog(
                                                title: "terjadi kesalahan",
                                                middleText:
                                                    "tidak berhasil edit sapi",
                                              );
                                            }
                                            print(cows);
                                            print(record);
                                          }

                                          recordCow();
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.grey,
                                        )),
                                  ),

                                  // trailing: Text(record["date"]),
                                );
                              }).toList(growable: false)),
                            ),
                          );
                        }
                        return const Text('data');
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
