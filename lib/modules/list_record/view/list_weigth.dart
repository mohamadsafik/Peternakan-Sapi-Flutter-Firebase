import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peternakan_sapi/constants/color.dart';

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
      appBar: AppBar(
        backgroundColor: green,
      ),
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
                      var recordweight = record['weight'];
                      return Card(
                        child: ListTile(
                          leading: const Icon(
                            Icons.monitor_weight_outlined,
                            color: Colors.orange,
                          ),
                          title: Text(
                            '$recordweight Kg',
                          ),
                          subtitle: Text(
                            record["date"],
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ),
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
