import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';

import '../../../constants/firebase_constants.dart';

class ListWeigth extends StatefulWidget {
  const ListWeigth({Key? key}) : super(key: key);

  @override
  State<ListWeigth> createState() => _ListWeigthState();
}

var currentUser = FirebaseAuth.instance.currentUser!.uid;

class _ListWeigthState extends State<ListWeigth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('cows')
            .where('uid', isEqualTo: currentUser)
            // .where('name', isEqualTo: data['name'])
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: streamSnapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) {
                if (streamSnapshot.data?.docs[index] != null) {
                  final map = streamSnapshot.data?.docs[index];
                  final records = map?["weights"] as List<dynamic>;
                  records.sort((a, b) => b["time"].compareTo(a["time"]));
                  return SingleChildScrollView(
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
                                // void recordCow() async {
                                //   DocumentReference cows = firestore
                                //       .collection("cows")
                                //       .doc(data.id);
                                //   try {
                                //     await cows.update(
                                //       {
                                //         "weights": FieldValue.arrayRemove(
                                //           [record],
                                //         )
                                //       },
                                //     );
                                //     Get.defaultDialog(
                                //       barrierDismissible: true,
                                //       title: "berhasil",
                                //       middleText: "berhasil record sapi",
                                //       onConfirm: () {
                                //         Get.back();
                                //       },
                                //       textConfirm: "okay",
                                //     );
                                //   } catch (e) {
                                //     if (kDebugMode) {
                                //       print(e);
                                //     }
                                //     Get.defaultDialog(
                                //       title: "terjadi kesalahan",
                                //       middleText: "tidak berhasil edit sapi",
                                //     );
                                //   }
                                //   print(cows);
                                //   print(record);
                                // }

                                // recordCow();
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ),

                        // trailing: Text(record["date"]),
                      );
                    }).toList(growable: false)),
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
    );
  }
}
