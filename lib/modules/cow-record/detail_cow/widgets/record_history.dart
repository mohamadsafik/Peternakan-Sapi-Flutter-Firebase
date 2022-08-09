import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/firebase_constants.dart';
import 'package:peternakan_sapi/modules/cow-record/record_pregnant.dart';
import 'package:peternakan_sapi/modules/cow-record/record_sick.dart';
import 'package:peternakan_sapi/modules/cow-record/record_vaksin.dart';
import 'package:peternakan_sapi/modules/cow-record/detail_record.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../../../component/alert_component.dart';
import '../../../../constants/color.dart';
import '../../inseminasi_buatan.dart';

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
                          onTap: () => Get.toNamed(RouteName.listevent),
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
                                            title: const Text("add"),
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
                                                            Icons.money_off),
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
                                                            Icons.attach_money),
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
                                                            Icons.dashboard),
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
                                          ))
                                  : showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: const Text("add"),
                                            content: SizedBox(
                                              height: 300.0,
                                              child: Column(
                                                children: <Widget>[
                                                  //this is the button to add income

                                                  Row(
                                                    children: <Widget>[
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Icon(
                                                            Icons.attach_money),
                                                      ),
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
                                                            Icons.attach_money),
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
                                                  //    the button to add expense
                                                  Row(
                                                    children: <Widget>[
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Icon(
                                                            Icons.money_off),
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
                                                            Icons.attach_money),
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
                                                            Icons.dashboard),
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
                                              // record[index].delete();
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
