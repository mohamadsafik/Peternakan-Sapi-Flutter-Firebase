import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/firebase_constants.dart';
import '../../../routes/route_name.dart';
import '../controller/home_controller.dart';

class TopMonitoring extends StatelessWidget {
  const TopMonitoring({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: Get.width / 40),
          child: const Text('Cows'),
        ),
        StreamBuilder(
            stream: controller.stream,
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData && streamSnapshot.data != null) {
                final int documentsum = streamSnapshot.data!.docs.length;
                return Container(
                  margin: const EdgeInsets.all(10),
                  width: Get.width,
                  height: 85,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  child: Stack(
                    children: [
                      const Positioned(
                          left: 5,
                          child: SizedBox(
                              height: 85,
                              child: Image(
                                  image: AssetImage('assets/home/cow1.png')))),
                      Positioned(
                        top: 20,
                        left: 125,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'sapi',
                            ),
                            (streamSnapshot.hasData)
                                ? Text(documentsum.toString())
                                : const Text('0')
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where('uidowner', isEqualTo: auth.currentUser?.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData && streamSnapshot.data != null) {
                final int sumEmployee = streamSnapshot.data!.docs.length;
                return Container(
                  margin: const EdgeInsets.all(10),
                  width: Get.width,
                  height: 85,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  child: Stack(
                    children: [
                      const Positioned(
                          left: 5,
                          child: SizedBox(
                              height: 85,
                              child: Image(
                                  image: AssetImage('assets/home/labor.png')))),
                      Positioned(
                        top: 20,
                        left: 125,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'tenaga kerja',
                            ),
                            (streamSnapshot.hasData)
                                ? Text(sumEmployee.toString())
                                : const Text('0')
                          ],
                        ),
                      ),
                      Positioned(
                        right: 20,
                        top: 20,
                        child: IconButton(
                            onPressed: () {
                              Get.toNamed(RouteName.employee);
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.grey,
                              size: 35,
                            )),
                      )
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ],
    );
  }
}
