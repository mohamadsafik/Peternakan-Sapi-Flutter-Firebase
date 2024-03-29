import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/firebase_constants.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../../component/alert_component.dart';
import '../../../constants/color.dart';
import '../../list_record/view/detail_record.dart';
import '../../add_record/view/record_inseminasi_buatan.dart';
import '../../add_record/view/record_pregnant.dart';
import '../../add_record/view/record_sick.dart';
import '../../add_record/view/record_vaksin.dart';


// ignore: camel_case_types
class record_history extends StatelessWidget {
  const record_history(
      {Key? key, required this.data, required this.currentUser})
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
                          onTap: () =>
                              Get.toNamed(RouteName.listevent, arguments: data),
                          child: const Icon(
                            Icons.list,
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
                        child: Text('Riwayat Pencatatan',
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
                          onTap: () =>
                              // Get.to(AddTaskPage(
                              //   docID: data.id,
                              //   data: data,
                              // )
                              (data['gender'] == 'Jantan')
                                  ? showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: const Text("Catat"),
                                            content: SizedBox(
                                              height: 160.0,
                                              child: Column(
                                                children: <Widget>[
                                                  //this is the button to add income

                                                  Row(
                                                    children: <Widget>[
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Icon(
                                                          Icons.sick,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            Get.to(
                                                                SickRecordPage(
                                                              docID: data.id,
                                                              data: data,
                                                            ));
                                                          },
                                                          child: const Text(
                                                              "Diagnosa Sakit"),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.0),
                                                          child: Icon(
                                                            Icons
                                                                .healing_rounded,
                                                            color: Colors.green,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            // Get.to(
                                                            //     InseminasiBuatanPage(
                                                            //   docID: data.id,
                                                            //   data: data,
                                                            // ));
                                                          },
                                                          child: const Text(
                                                              "Catat Sembuh"),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  //    this is the button to add category
                                                  Row(
                                                    children: <Widget>[
                                                      const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.0),
                                                          child: Icon(
                                                            Icons.vaccines,
                                                            color: Colors.grey,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            Get.to(VaksinRecord(
                                                              docID: data.id,
                                                              data: data,
                                                            ));
                                                          },
                                                          child: const Text(
                                                              "Vaksin"),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))
                                  : showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: const Text("add"),
                                            content: SizedBox(
                                              height: 320.0,
                                              child: Column(
                                                children: <Widget>[
                                                  //this is the button to add income

                                                  Row(
                                                    children: <Widget>[
                                                      const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.0),
                                                          child: Icon(
                                                            Icons.info,
                                                            color: Colors.grey,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            Get.to(
                                                                InseminasiBuatanPage(
                                                              docID: data.id,
                                                              data: data,
                                                            ));
                                                          },
                                                          child: const Text(
                                                              "Inseminasi Buatan"),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Icon(
                                                          Icons.info,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            Get.to(
                                                                PregnantRecordPage(
                                                              docID: data.id,
                                                              data: data,
                                                            ));
                                                          },
                                                          child: const Text(
                                                              "Catat Hamil (PKB)"),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.0),
                                                          child: Icon(
                                                            Icons.info,
                                                            color: Colors.grey,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            Get.toNamed(
                                                                RouteName
                                                                    .addcow,
                                                                arguments:
                                                                    data);
                                                            // Get.to(
                                                            // //     PregnantRecordPage(
                                                            // //   docID: data.id,
                                                            // //   data: data,
                                                            // // )
                                                            // );
                                                          },
                                                          child: const Text(
                                                              "Catat Kelahiran"),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Icon(
                                                          Icons.sick,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            Get.to(
                                                                SickRecordPage(
                                                              docID: data.id,
                                                              data: data,
                                                            ));
                                                          },
                                                          child: const Text(
                                                              "Diagnosa Sakit"),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Icon(
                                                          Icons.healing,
                                                          color: Colors.green,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            // Get.to(
                                                            //     InseminasiBuatanPage(
                                                            //   docID: data.id,
                                                            //   data: data,
                                                            // ));
                                                          },
                                                          child: const Text(
                                                              "Catat Sembuh"),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  //    this is the button to add category
                                                  Row(
                                                    children: <Widget>[
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Icon(
                                                          Icons.vaccines,
                                                          color: Colors.amber,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            Get.to(VaksinRecord(
                                                              docID: data.id,
                                                              data: data,
                                                            ));
                                                          },
                                                          child: const Text(
                                                              "Vaksin"),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
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
                          final records = map?["record"] as List<dynamic>;
                          records
                              .sort((a, b) => b["time"].compareTo(a["time"]));
                          return SizedBox(
                            height: 100,
                            child: SingleChildScrollView(
                              child: Column(
                                  children: records.map((record) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(DetailRecordPage(data: record));
                                  },
                                  child: Card(
                                    child: ListTile(
                                        leading: const Icon(
                                          Icons.warning,
                                          color: Colors.orange,
                                        ),
                                        title: Text(
                                          record["action"],
                                        ),
                                        subtitle: Text(record["date"]),
                                        trailing: IconButton(
                                            onPressed: () {
                                              void recordCow() async {
                                                DocumentReference cows =
                                                    firestore
                                                        .collection("cows")
                                                        .doc(data.id);
                                                try {
                                                  await cows.update(
                                                    {
                                                      "record": FieldValue
                                                          .arrayRemove(
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
                                              }

                                              recordCow();
                                            },
                                            icon: Icon(Icons.delete))),
                                  ),
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
