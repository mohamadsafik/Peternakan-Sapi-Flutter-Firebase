import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/firebase_constants.dart';
import 'package:peternakan_sapi/modules/role-employee/listcow/controller/list_cow_employee_controller.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../../../../constants/color.dart';
import '../../../list_cow/controller/list_cow_controller.dart';
import '../components/search_data.dart';

class ListCowsEmployee extends StatefulWidget {
  const ListCowsEmployee({
    Key? key,
  }) : super(key: key);

  @override
  State<ListCowsEmployee> createState() => _ListCowsEmployeeState();
}

class _ListCowsEmployeeState extends State<ListCowsEmployee> {
  final controller = Get.find<ListCowEmployeeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              backgroundColor: green,
              title: Card(
                child: TextField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search), hintText: 'Search...'),
                  controller: controller.searchController,
                ),
              ),
              actions: [
                GetBuilder<ListCowController>(
                  init: ListCowController(),
                  builder: (val) {
                    return IconButton(
                        onPressed: () {
                          val
                              .queryData(controller.searchController.text)
                              .then((value) {
                            controller.snapshotData = value;
                            setState(() {
                              controller.isExecuted = true;
                            });
                          });
                        },
                        icon: const Icon(Icons.search));
                  },
                ),
                StreamBuilder(
                    stream: controller.stream,
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      return IconButton(
                          onPressed: () {
                            controller.scanner
                                .scanBarcode(context, streamSnapshot);
                          },
                          icon: const Icon(
                            Icons.qr_code_scanner,
                            size: 30,
                            color: Colors.white,
                          ));
                    }),
              ],
            )),
        body: (controller.isExecuted)
            ? searchedData(controller)
            : StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('uid', isEqualTo: auth.currentUser?.uid)
                    .snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.data != null) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot usersnapshot =
                              streamSnapshot.data!.docs[index];
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height / 1.3,
                                  width: Get.width,
                                  child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('cows')
                                        .orderBy('name')
                                        .where('uid',
                                            isEqualTo: usersnapshot['uidowner'])
                                        .snapshots(),
                                    builder: (context,
                                        AsyncSnapshot<QuerySnapshot>
                                            streamSnapshot) {
                                      if (streamSnapshot.data != null) {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              streamSnapshot.data!.docs.length,
                                          itemBuilder: (context, index) {
                                            final DocumentSnapshot
                                                documentSnapshot =
                                                streamSnapshot
                                                    .data!.docs[index];
                                            final int documentsum =
                                                streamSnapshot
                                                    .data!.docs.length;
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                  bottom: 4,
                                                  top: 4),
                                              width: Get.width,
                                              height: 72,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: ListTile(
                                                leading: SizedBox(
                                                    height: 60.0,
                                                    width: 60.0,
                                                    child: documentSnapshot[
                                                                'image'] !=
                                                            null
                                                        ? Image.network(
                                                            documentSnapshot[
                                                                    'image']
                                                                .toString())
                                                        : Image.asset(
                                                            'assets/home/cow1.png',
                                                            // fit: BoxFit.cover,
                                                          )),
                                                title: Text(
                                                  documentSnapshot['name']
                                                      .toString(),
                                                ),
                                                subtitle: Text(
                                                    documentSnapshot['gender']),
                                                trailing: SizedBox(
                                                  width: 100,
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () =>
                                                              Get.toNamed(
                                                                RouteName
                                                                    .updatecow,
                                                                arguments:
                                                                    documentSnapshot,
                                                              ),
                                                          icon: const Icon(
                                                            Icons.edit,
                                                            color: Colors.grey,
                                                          )),
                                                      IconButton(
                                                          onPressed: () =>
                                                              controller.deleteSapi(
                                                                  documentSnapshot
                                                                      .id),
                                                          icon: const Icon(
                                                            Icons.delete,
                                                            color: Colors.red,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                                onTap: () => Get.toNamed(
                                                  RouteName.detailcow,
                                                  arguments: documentSnapshot,
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
                          );
                        });
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }));
  }
}
