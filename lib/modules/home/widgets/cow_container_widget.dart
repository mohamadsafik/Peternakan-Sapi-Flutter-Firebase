import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/constant.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../../constants/firebase_constants.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../../controllers/list_cow_controller.dart';

class CowContainer extends StatelessWidget {
  CowContainer({Key? key}) : super(key: key);
  final controller = Get.find<ListCowController>();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width / 40),
          child: const Text('Cows'),
        ),

        StreamBuilder(
            stream: controller.stream,
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData && streamSnapshot.data != null) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      // final DocumentSnapshot documentSnapshot =
                      //     streamSnapshot.data!.docs[index];
                      final int documentsum = streamSnapshot.data!.docs.length;
                      return Container(
                        margin: const EdgeInsets.all(10),
                        width: width,
                        height: 85,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: Stack(
                          children: [
                            Positioned(
                                left: 5,
                                child: SizedBox(
                                    height: 85,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/home/cow1.png')))),
                            Positioned(
                              top: 20,
                              left: 125,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'sapi',
                                  ),
                                  (streamSnapshot.hasData)
                                      ? Text(documentsum.toString())
                                      : const Text('0')
                                ],
                              ),
                            ),
                            // Positioned(
                            //   right: 20,
                            //   top: 20,
                            //   child: ,
                            //   // child: IconButton(
                            //   //     onPressed: () {
                            //   //       // AuthController.authInstance.signOut();
                            //   //     },
                            //   //     icon: const Icon(
                            //   //       Icons.arrow_forward,
                            //   //       color: Colors.grey,
                            //   //       size: 35,
                            //   //     )),
                            // )
                          ],
                        ),
                      );
                    });
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
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      // final DocumentSnapshot documentSnapshot =
                      //     streamSnapshot.data!.docs[index];
                      final int sumEmployee = streamSnapshot.data!.docs.length;
                      return Container(
                        margin: const EdgeInsets.all(10),
                        width: width,
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
                                        image: AssetImage(
                                            'assets/home/labor.png')))),
                            Positioned(
                              top: 20,
                              left: 125,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
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
                    });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
        // Container(
        //   margin: const EdgeInsets.all(10),
        //   width: width,
        //   height: 85,
        //   decoration: BoxDecoration(
        //       border: Border.all(color: Colors.grey),
        //       borderRadius: BorderRadius.circular(8)),
        //   child: Stack(
        //     children: [
        //       const Positioned(
        //           left: 5,
        //           child: SizedBox(
        //               height: 85,
        //               child: Image(image: AssetImage('assets/home/cow3.png')))),
        //       Positioned(
        //         top: 20,
        //         left: 125,
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: const [
        //             Text(
        //               'tores',
        //             ),
        //             Text(
        //               '15',
        //             ),
        //           ],
        //         ),
        //       ),
        //       Positioned(
        //         right: 20,
        //         top: 20,
        //         child: IconButton(
        //             onPressed: () {},
        //             icon: const Icon(
        //               Icons.arrow_forward,
        //               color: Colors.grey,
        //               size: 35,
        //             )),
        //       )
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
