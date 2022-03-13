import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/controllers/list_cowController.dart';
import 'package:peternakan_sapi/screens/detail_sapi.dart';
import 'package:peternakan_sapi/screens/edit_cow.dart';
import 'add_cows.dart';

class ListCows extends GetView<ListCowController> {
  ListCows({Key? key}) : super(key: key);

  var currentUser = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LIST'),
        ),
        //streambuilder agar membaca data realtime
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('cows')
              .where('uid', isEqualTo: currentUser)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                    child: Container(
                      child: ListTile(
                        leading: SizedBox(
                            height: 70.0,
                            width: 70.0, // fixed width and height
                            child: Image.network(
                                "https://www.duniasapi.com/media/k2/items/cache/75b44b0e9c2e5d305fa323c6c51d3476_XL.jpg")),
                        title: Text(documentSnapshot['name'].toString()),
                        subtitle: Text(documentSnapshot['gender'].toString()),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () => Get.to(EditCowsPage(
                                        docID: documentSnapshot.id,
                                        data: documentSnapshot,
                                      )),
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  )),
                              IconButton(
                                  onPressed: () => controller
                                      .deleteSapi(documentSnapshot.id),
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.green,
                                  )),
                            ],
                          ),
                        ),
                        onTap: () => Get.to(
                          DetailSapiPage(
                            data: documentSnapshot,
                          ),
                          // arguments: Get.arguments[documentSnapshot],
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () => Get.to(AddCowsPage()),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          child: const Icon(Icons.add),
        ));
  }
}
