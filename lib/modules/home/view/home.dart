import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/modules/home/controller/home_controller.dart';
import 'package:peternakan_sapi/modules/cows/list_cow/controller/list_cow_controller.dart';
import 'package:peternakan_sapi/modules/home/article.dart';
import '../../cows/list_record/view/list_activity.dart';
import '../../weight_prediction/view/record_weight_prediction.dart';
import '../widgets/cow_container_widget.dart';
import '../widgets/drawer.dart';
import '../widgets/monitoring_widget.dart';

// import 'package:hexcolor/hexcolor.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  final controller = Get.find<ListCowController>();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: green,
            actions: [],
          )),
      backgroundColor: background,
      drawer: const drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const Top_Container_Widget(),
            const SizedBox(height: 5),
            CowContainer(),
            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Container(
                  color: Colors.transparent,
                  height: 75,
                  width: 75,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(ListActivity());
                        },
                        child: SizedBox(
                          height: 50,
                          child: Image(
                            image: AssetImage('assets/home/activity.png'),
                          ),
                        ),
                      ),
                      Text(
                        'Aktifitas',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  )),
              Container(
                  color: Colors.transparent,
                  height: 75,
                  width: 75,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 50,
                        child: Image(
                          image: AssetImage('assets/home/cowshed.png'),
                        ),
                      ),
                      Text(
                        'Kandang',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  )),
              Container(
                  color: Colors.transparent,
                  height: 75,
                  width: 75,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(WeightPredictionPage());
                        },
                        child: const SizedBox(
                          height: 50,
                          child: Image(
                            image: AssetImage('assets/home/weight.png'),
                          ),
                        ),
                      ),
                      const Text(
                        'Bobot',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  )),
              Container(
                  color: Colors.transparent,
                  height: 75,
                  width: 75,
                  child: Column(
                    children: [
                      StreamBuilder(
                          stream: controller.stream,
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                            return SizedBox(
                              height: 50,
                              child: GestureDetector(
                                onTap: () {
                                  controller.scanBarcode(
                                      context, streamSnapshot);
                                },
                                child: const Image(
                                  image: AssetImage('assets/home/qr-scan.png'),
                                ),
                              ),
                            );
                          }),
                      Text(
                        'Scan',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  )),
            ]),
            const SizedBox(height: 10),
            monitoring_widget(),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: width / 40, right: width / 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Edukasi'),
                ],
              ),
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
                      // scrollDirection: Axis.horizontal,
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
                                          color: Color.fromARGB(
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
