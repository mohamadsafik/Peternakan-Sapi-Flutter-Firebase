import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/color.dart';
import '../../../list_task/list_task.dart';
import '../../record/record.dart';

// ignore: camel_case_types
class record_history extends StatelessWidget {
  const record_history({
    Key? key,
    required this.data,
    required this.currentUser,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final data;
  final String currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFEBFEF6),
      ),
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
                      color: const Color(0xFFEBFEF6),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => Get.to(ListTask()),
                        child: const Icon(
                          Icons.list,
                          color: Colors.black,
                        ),
                      ),
                    )),
                const SizedBox(width: 5),
                Container(
                    height: 30,
                    width: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: green,
                    ),
                    child: const Center(
                      child: Text('Riwayat Pencatatan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                    )),
                const SizedBox(width: 5),
                Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFEBFEF6),
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
                  // .where(Document(), isEqualTo: data[data.id])
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
                        return Card(
                          child: record['action'] == ''
                              ? null
                              : ListTile(
                                  title: Text(
                                    record["action"],
                                  ),
                                ),
                        );
                      }).toList());
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
    );
  }
}
