import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/modules/home/controller/home_controller.dart';
import 'package:peternakan_sapi/modules/article.dart';
import '../../list_record/view/list_activity.dart';
import '../../weight_prediction/view/record_weight_prediction.dart';
import '../widgets/cow_container_widget.dart';
import '../widgets/drawer.dart';
import '../widgets/monitoring_widget.dart';

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
            CowContainer(),
            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              iconFeatureButton(
                ListActivity(),
                const Image(image: AssetImage("assets/home/activity.png")),
                "Aktifitas",
              ),
              iconFeatureButton(
                null,
                const Image(image: AssetImage("assets/home/cowshed.png")),
                "Kandang",
              ),
              iconFeatureButton(
                WeightPredictionPage(),
                const Image(image: AssetImage("assets/home/weight.png")),
                "Bobot",
              ),
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
                            return GestureDetector(
                                onTap: () {
                                  controller.scanner
                                      .scanBarcode(context, streamSnapshot);
                                },
                                child: const SizedBox(
                                    height: 50,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/home/qr-scan.png"))));
                          }),
                      const Text(
                        'Scan',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  )),
            ]),
            const SizedBox(height: 10),
            monitoring_widget(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Edukasi'),
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

  Container iconFeatureButton(
    var gestureDetector,
    Widget image,
    String text,
  ) {
    return Container(
        color: Colors.transparent,
        height: 75,
        width: 75,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(gestureDetector);
              },
              child: SizedBox(height: 50, child: image),
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 15),
            )
          ],
        ));
  }
}
