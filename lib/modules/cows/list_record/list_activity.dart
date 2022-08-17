import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';

import '../../../constants/firebase_constants.dart';
import '../../../controllers/list_event_controller.dart';
import '../record/detail_record.dart';
import 'update_record.dart';

// ignore: must_be_immutable
class ListActivity extends StatelessWidget {
  ListActivity({Key? key}) : super(key: key);
  // final controller = Get.find<ListEventController>();
  var currentUser = FirebaseAuth.instance.currentUser!.uid;
  // final data;
  // var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: green,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('cows')
              .where('uid', isEqualTo: currentUser)
              // .where('eartag', isEqualTo: data['eartag'])
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final map = streamSnapshot.data!.docs[index];
                  final records = map["record"] as List<dynamic>;
                  //sort data terbaru berdasarkan time
                  records.sort((a, b) => b["time"].compareTo(a["time"]));
                  return Column(
                      children: records.map((record) {
                    var diagnosis = record['diagnosis'];
                    var action = record['action'];
                    return GestureDetector(
                      onTap: () {
                        Get.to(DetailRecordPage(data: record));
                      },
                      child: Card(
                          child: Container(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.asset(
                                'assets/home/cow1.png',
                                // fit: BoxFit.cover,
                              ),
                              title: Text(map['name']),
                              subtitle: Text(map['gender']),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.info_rounded,
                                color: Color.fromARGB(255, 204, 186, 26),
                              ),
                              title: Text((record['action'] == 'Sakit')
                                  ? '$action ' '($diagnosis)'
                                  : record['action']),
                              trailing: Text(record['date']),
                            ),
                            const Divider(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Petugas :'),
                                      Text(record['doctor']),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  (record['kandungan'] != null)
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Usia Kandungan :'),
                                            Text(record['kandungan']),
                                          ],
                                        )
                                      : const SizedBox(
                                          height: 0,
                                        ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text((record['action'] == 'Sakit')
                                          ? 'Catatan Sakit'
                                          : 'Kode Semen :'),
                                      Text(record['noted']),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Pencatat :'),
                                      Text(record['person']),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                    );
                  }).toList());
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
