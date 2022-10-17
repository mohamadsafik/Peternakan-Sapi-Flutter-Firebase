import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/modules/home/controller/home_controller.dart';
import 'package:peternakan_sapi/modules/article.dart';
import '../../../constants/firebase_constants.dart';
import '../../../routes/route_name.dart';
import '../../list_record/view/list_activity.dart';
import '../../weight_prediction/view/record_weight_prediction.dart';
import '../components/icon_feature_button.dart';
import '../components/drawer.dart';
import '../components/monitoring_card.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: green,
          )),
      backgroundColor: background,
      drawer: const drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Get.width / 40),
                  child: const Text('Cows'),
                ),
                StreamBuilder(
                    stream: controller.stream,
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData &&
                          streamSnapshot.data != null) {
                        final int documentsum =
                            streamSnapshot.data!.docs.length;
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
                                          image: AssetImage(
                                              'assets/home/cow1.png')))),
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
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData &&
                          streamSnapshot.data != null) {
                        final int sumEmployee =
                            streamSnapshot.data!.docs.length;
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
                                          image: AssetImage(
                                              'assets/home/labor.png')))),
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
            ),
            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              GestureDetector(
                onTap: () {
                  Get.to(ListActivity());
                },
                child: IconFeatureButton(
                    controller: controller,
                    image: "assets/home/activity.png",
                    title: "Aktifitas"),
              ),
              GestureDetector(
                onTap: () {},
                child: IconFeatureButton(
                    controller: controller,
                    image: "assets/home/cowshed.png",
                    title: "Kandang"),
              ),
              GestureDetector(
                onTap: () {
                  WeightPredictionPage();
                },
                child: IconFeatureButton(
                    controller: controller,
                    image: "assets/home/weight.png",
                    title: "Bobot"),
              ),
              StreamBuilder(
                  stream: controller.stream,
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    return GestureDetector(
                      onTap: () {
                        controller.scanner.scanBarcode(context, streamSnapshot);
                      },
                      child: IconFeatureButton(
                        controller: controller,
                        image: 'assets/home/qr-scan.png',
                        title: 'Scan',
                      ),
                    );
                  }),
            ]),
            const SizedBox(height: 10),
            StreamBuilder(
                stream: controller.stream,
                builder: (context, snapshot) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: Get.width / 30),
                        child: const Text(
                          'Monitoring',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width / 40,
                          ),
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('cows')
                                  .where('uid',
                                      isEqualTo: auth.currentUser?.uid)
                                  .where('gender', isEqualTo: "Jantan")
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                                if (streamSnapshot.hasData &&
                                    streamSnapshot.data != null) {
                                  final int sumJantan =
                                      streamSnapshot.data!.docs.length;
                                  return MonitoringCard(
                                    colorBg:
                                        const Color.fromARGB(255, 147, 177, 202)
                                            .withOpacity(0.3),
                                    colorIcon:
                                        const Color.fromARGB(255, 17, 107, 180),
                                    icon: Icons.male,
                                    subtitle: 'Jantan',
                                    title: '$sumJantan',
                                  );
                                }
                                return const CircularProgressIndicator();
                              }),
                          SizedBox(
                            width: Get.width / 40,
                          ),
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('cows')
                                  .where('uid',
                                      isEqualTo: auth.currentUser?.uid)
                                  .where('gender', isEqualTo: "Betina")
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                                if (streamSnapshot.hasData &&
                                    streamSnapshot.data != null) {
                                  final int sumBetina =
                                      streamSnapshot.data!.docs.length;
                                  return MonitoringCard(
                                    colorBg:
                                        const Color.fromARGB(255, 250, 80, 68)
                                            .withOpacity(0.3),
                                    colorIcon:
                                        const Color.fromARGB(255, 197, 86, 78),
                                    icon: Icons.female,
                                    subtitle: 'Betina',
                                    title: '$sumBetina',
                                  );
                                }
                                return const CircularProgressIndicator();
                              })
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: Get.width / 40),
                            height: 90,
                            width: Get.width / 2.162162162,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 59, 209, 116)
                                    .withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: ListTile(
                                leading: const SizedBox(
                                  height: 70.0,
                                  width: 60.0, // fixed width and height
                                  child: Image(
                                      image:
                                          AssetImage('assets/home/cow4.png')),
                                ),
                                title: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('cows')
                                        .where('uid',
                                            isEqualTo: auth.currentUser?.uid)
                                        .where('statuspregnant',
                                            isEqualTo: "Hamil")
                                        .snapshots(),
                                    builder: (context,
                                        AsyncSnapshot<QuerySnapshot>
                                            streamSnapshot) {
                                      if (streamSnapshot.hasData &&
                                          streamSnapshot.data != null) {
                                        final int sumPregnant =
                                            streamSnapshot.data!.docs.length;
                                        return Text((streamSnapshot.hasData)
                                            ? sumPregnant.toString()
                                            : '0');
                                      }
                                      return const CircularProgressIndicator();
                                    }),
                                subtitle: const Text(
                                  'Hamil',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 29, 121, 57),
                                    fontFamily: 'poppins',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 40,
                          ),
                          Container(
                            height: 90,
                            width: Get.width / 2.162162162,
                            decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: ListTile(
                                  leading: const SizedBox(
                                    height: 70.0,
                                    width: 60.0, // fixed width and height
                                    child: Image(
                                        image: AssetImage(
                                            'assets/home/thermometer.png')),
                                  ),
                                  title: StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('cows')
                                          .where('uid',
                                              isEqualTo: auth.currentUser?.uid)
                                          .where('statussick',
                                              isEqualTo: "Sakit")
                                          .snapshots(),
                                      builder: (context,
                                          AsyncSnapshot<QuerySnapshot>
                                              streamSnapshot) {
                                        if (streamSnapshot.hasData &&
                                            streamSnapshot.data != null) {
                                          // final DocumentSnapshot documentSnapshot =
                                          //     streamSnapshot.data!.docs[index];
                                          final int sumSick =
                                              streamSnapshot.data!.docs.length;
                                          return Text((streamSnapshot.hasData)
                                              ? sumSick.toString()
                                              : '0');
                                        }
                                        return const CircularProgressIndicator();
                                      }),
                                  subtitle: const Text(
                                    'Sakit',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 218, 105, 0),
                                      fontFamily: 'poppins',
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text('Edukasi'),
                ),
              ],
            ),
            SizedBox(
              height: 200.0,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('article')
                    .snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.data != null) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return (streamSnapshot.hasData)
                            ? GestureDetector(
                                onTap: () {
                                  Get.to(
                                      ArticlePage(
                                        data: documentSnapshot,
                                      ),
                                      arguments: documentSnapshot);
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  width: 250.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: background,
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        height: 113,
                                        child: Image.asset(
                                          "assets/home/sapibirahi.jpeg",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Container(
                                          height: 65,
                                          width: 250,
                                          color: const Color.fromARGB(
                                              255, 209, 208, 208),
                                          child: ListTile(
                                            title:
                                                Text(documentSnapshot['title']),
                                            subtitle:
                                                Text(documentSnapshot['date']),
                                          ))
                                    ],
                                  ),
                                ),
                              )
                            : const CircularProgressIndicator();
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
    );
  }
}
