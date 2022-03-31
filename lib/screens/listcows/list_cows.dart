import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/screens/detailcow/detail_sapi.dart';
import '../../constants/color.dart';
import '../addcow/add_cows.dart';
import '../editcow/edit_cow.dart';
import 'controller/list_cow_controller.dart';

class ListCows extends StatelessWidget {
  ListCows({Key? key}) : super(key: key);
  final controller = Get.put(ListCowController());

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
              height: 619,
              width: 500,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('cows')
                    .orderBy('name')
                    .where('uid', isEqualTo: controller.currentUser)
                    .snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Card(
                          margin: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                          child: SizedBox(
                            child: ListTile(
                              leading: SizedBox(
                                  height: 70.0,
                                  width: 70.0, // fixed width and height
                                  child: Image.network(
                                      "https://www.duniasapi.com/media/k2/items/cache/75b44b0e9c2e5d305fa323c6c51d3476_XL.jpg")),
                              title: Text(documentSnapshot['name'].toString()),
                              subtitle:
                                  Text(documentSnapshot['gender'].toString()),
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
                                  // docId: documentSnapshot.id,
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
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () => Get.to(const AddCowsPage()),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          child: const Icon(Icons.add),
        ));
  }
}
