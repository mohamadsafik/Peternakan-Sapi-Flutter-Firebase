import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/list_cow/controller/list_cow_controller.dart';

import '../../../routes/route_name.dart';

SingleChildScrollView listCow(
    double height, double width, ListCowController controller) {
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          height: height / 1.3,
          width: width,
          child: StreamBuilder(
            stream: controller.stream,
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.data != null) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    final map = streamSnapshot.data!.docs[index];
                    var nama = documentSnapshot['name'].toString();
                    var nomortag = documentSnapshot['nomortag'].toString();
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
                                : Image.asset(
                                    'assets/home/cow1.png',
                                  )),
                        title: Text(
                          "$nama",
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
                                  onPressed: () {
                                    controller.deleteSapi(documentSnapshot.id);
                                  },
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
}
