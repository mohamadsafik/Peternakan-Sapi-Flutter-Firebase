import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/list_cow/components/search_data.dart';
import 'package:peternakan_sapi/routes/route_name.dart';
import '../../../constants/color.dart';
import '../components/list_cow.dart';

import '../controller/list_cow_controller.dart';
import '../../home/components/drawer.dart';

class ListCows extends StatefulWidget {
  const ListCows({
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

    return Scaffold(
        backgroundColor: background,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80), child: appBar()),
        body: (controller.isExecuted)
            ? searchedData(controller)
            : listCow(height, width, controller),
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () => Get.toNamed(RouteName.addcow),
          child: const Icon(Icons.add),
        ));
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: green,
      actions: [
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: background, borderRadius: BorderRadius.circular(18)),
            margin: const EdgeInsets.only(top: 10),
            width: Get.width / 1.4,
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: GetBuilder<ListCowController>(
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
                  hintText: '     Cari...'),
              controller: controller.searchController,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        StreamBuilder(
            stream: controller.stream,
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              return IconButton(
                  onPressed: () {
                    controller.scanner.scanBarcode(context, streamSnapshot);
                  },
                  icon: const Icon(
                    Icons.qr_code_scanner,
                    size: 30,
                    color: Colors.white,
                  ));
            }),
      ],
    );
  }
}
