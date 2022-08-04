import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../../../constants/color.dart';
import '../../record_task.dart';

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
                          onTap: () => Get.to(AddTaskPage(
                            docID: data.id,
                            data: data,
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
                                return Card(
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.warning,
                                      color: Colors.orange,
                                    ),
                                    title: Text(
                                      record["action"],
                                    ),
                                    trailing: Text(record["date"]),
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
