import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/color.dart';
import '../controller/list_event_controller.dart';

// ignore: must_be_immutable
class ListEvent extends StatelessWidget {
  ListEvent({Key? key}) : super(key: key);
  final controller = Get.find<ListEventController>();
  var currentUser = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      //streambuilder agar membaca data realtime
      body: Column(
        children: [
          Container(
            height: 100,
            width: 400,
            decoration: const BoxDecoration(
              color: green,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Morning',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        'Tores',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(230, 0, 0, 0),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
          SizedBox(
            height: 500,
            width: 500,
            child: StreamBuilder<QuerySnapshot>(
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
          ),
        ],
      ),
    );
  }
}
