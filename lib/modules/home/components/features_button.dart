import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../list_record/view/list_activity.dart';
import '../../weight_prediction/view/record_weight_prediction.dart';
import '../controller/home_controller.dart';

class FeatureButton extends StatelessWidget {
  const FeatureButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
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
    ]);
  }
}

class IconFeatureButton extends StatelessWidget {
  final String image;
  final String title;
  const IconFeatureButton({
    Key? key,
    required this.controller,
    required this.image,
    required this.title,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        height: 75,
        width: 75,
        child: Column(
          children: [
            SizedBox(height: 50, child: Image(image: AssetImage(image))),
            Text(
              title,
              style: const TextStyle(fontSize: 15),
            )
          ],
        ));
  }
}
