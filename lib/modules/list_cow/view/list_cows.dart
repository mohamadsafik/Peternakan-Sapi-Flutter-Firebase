import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/routes/route_name.dart';
import '../../../constants/color.dart';
import '../controller/list_cow_controller.dart';

class ListCows extends StatelessWidget {
  ListCows({Key? key, transitionType}) : super(key: key);

  final controller = Get.find<ListCowController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: width,
                decoration: const BoxDecoration(
                  color: green,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(width / 15, 30, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'List',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Sapi',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(width * 0.55, 0, 0, 0),
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
                      child: StreamBuilder(
                          stream: controller.stream,
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                            return IconButton(
                                onPressed: () {
                                  controller.scanBarcode(
                                      context, streamSnapshot);
                                },
                                icon: const Icon(
                                  Icons.qr_code_scanner,
                                  size: 30,
                                  color: Colors.white,
                                ));
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height / 1.3,
                width: width,
                child: StreamBuilder(
                  stream: controller.stream,
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.connectionState ==
                            ConnectionState.active &&
                        streamSnapshot.hasData &&
                        streamSnapshot.data != null) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
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
                                          documentSnapshot['image'].toString())
                                      : SvgPicture.asset(
                                          'assets/listcow/default.svg',
                                          // fit: BoxFit.cover,
                                        )),
                              title: Text(
                                documentSnapshot['name'].toString(),
                              ),
                              subtitle:
                                  Text(documentSnapshot['gender'].toString()),
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
                                        onPressed: () => controller
                                            .deleteSapi(documentSnapshot.id),
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
