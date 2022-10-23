import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/modules/home/controller/home_controller.dart';

import '../components/education.dart';
import '../components/features_button.dart';

import '../components/monitoring.dart';
import '../components/top_monitoring.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
      ),
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            TopMonitoring(controller: controller),
            const SizedBox(height: 5),
            FeatureButton(controller: controller),
            const SizedBox(height: 10),
            const Monitoring(),
            const SizedBox(height: 10),
            const Education()
          ],
        ),
      ),
    );
  }
}
