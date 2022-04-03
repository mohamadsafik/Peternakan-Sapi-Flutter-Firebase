import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/color.dart';
import '../../list_event.dart';
import '../../record.dart';

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: background,
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
                      color: background,
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => Get.to(ListEvent()),
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
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: streamSnapshot.data?.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (streamSnapshot.data?.docs[index] != null) {
                        final map = streamSnapshot.data?.docs[index];
                        final records = map?["record"] as List<dynamic>;
                        records.sort((a, b) => b["time"].compareTo(a["time"]));
                        return Column(
                            children: records.map((record) {
                          return Card(
                            child:
                                // record == null
                                // ? null
                                // :
                                ListTile(
                              title: Text(
                                record["action"],
                              ),
                            ),
                          );
                        }).toList());
                      }
                      return Text('data');
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
