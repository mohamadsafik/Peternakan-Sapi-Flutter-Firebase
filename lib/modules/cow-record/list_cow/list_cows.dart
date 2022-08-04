import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../../constants/color.dart';
import '../../../controllers/list_cow_controller.dart';
import '../../home/widgets/drawer.dart';

class ListCows extends StatefulWidget {
  ListCows({
    Key? key,
  }) : super(key: key);

  @override
  State<ListCows> createState() => _ListCowsState();
}

class _ListCowsState extends State<ListCows> {
  final controller = Get.find<ListCowController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    Widget searchedData() {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: controller.snapshotData.docs.length,
          itemBuilder: (BuildContext context, int index) {
            final DocumentSnapshot documentSnapshot =
                controller.snapshotData.docs[index];
            return Container(
              margin:
                  const EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 4),
              width: width,
              height: 72,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                leading: SizedBox(
                    height: 60.0,
                    width: 60.0,
                    child: documentSnapshot['image'] != null
                        ? Image.network(documentSnapshot['image'].toString())
                        : Image.asset(
                            'assets/home/cow1.png',
                            // fit: BoxFit.cover,
                          )),
                title: Text(
                  documentSnapshot['name'].toString(),
                ),
                subtitle: Text(documentSnapshot['gender']),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () => Get.toNamed(
                                RouteName.updatecow,
                                arguments: documentSnapshot,
                              ),
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.grey,
                          )),
                      IconButton(
                          onPressed: () =>
                              controller.deleteSapi(documentSnapshot.id),
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
          });
    }

    return Scaffold(
        backgroundColor: background,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              backgroundColor: green,
              actions: [
                Center(
                  child: Container(
                    height: 50,
                    width: 250,
                    color: background,
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: GetBuilder<ListCowController>(
                            init: ListCowController(),
                            builder: (val) {
                              return IconButton(
                                  onPressed: () {
                                    val
                                        .queryData(
                                            controller.searchController.text)
                                        .then((value) {
                                      controller.snapshotData = value;
                                      setState(() {
                                        controller.isExecuted = true;
                                      });
                                    });
                                  },
                                  icon: Icon(Icons.search));
                            },
                          ),
                          hintText: '  Search...'),
                      controller: controller.searchController,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                StreamBuilder(
                    stream: controller.stream,
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      return IconButton(
                          onPressed: () {
                            controller.scanBarcode(context, streamSnapshot);
                          },
                          icon: const Icon(
                            Icons.qr_code_scanner,
                            size: 30,
                            color: Colors.white,
                          ));
                    }),
              ],
            )),
        drawer:  drawer(),
        body: (controller.isExecuted)
            ? searchedData()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height / 1.3,
                      width: width,
                      child: StreamBuilder(
                        stream: controller.stream,
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                          if (streamSnapshot.data != null) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: streamSnapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                final DocumentSnapshot documentSnapshot =
                                    streamSnapshot.data!.docs[index];
                                final int documentsum =
                                    streamSnapshot.data!.docs.length;
                                return Container(
                                  margin: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 4, top: 4),
                                  width: width,
                                  height: 72,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: ListTile(
                                    leading: SizedBox(
                                        height: 60.0,
                                        width: 60.0,
                                        child: documentSnapshot['image'] != null
                                            ? Image.network(
                                                documentSnapshot['image']
                                                    .toString())
                                            : Image.asset(
                                                'assets/home/cow1.png',
                                                // fit: BoxFit.cover,
                                              )),
                                    title: Text(
                                      documentSnapshot['name'].toString(),
                                    ),
                                    subtitle: Text(documentSnapshot['gender']),
                                    trailing: SizedBox(
                                      width: 100,
                                      child: Row(
                                        children: [
                                          IconButton(
                                              onPressed: () => Get.toNamed(
                                                    RouteName.updatecow,
                                                    arguments: documentSnapshot,
                                                  ),
                                              icon: const Icon(
                                                Icons.edit,
                                                color: Colors.grey,
                                              )),
                                          IconButton(
                                              onPressed: () =>
                                                  controller.deleteSapi(
                                                      documentSnapshot.id),
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
              ),
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () => Get.toNamed(RouteName.addcow),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          child: const Icon(Icons.add),
        ));
  }
}
