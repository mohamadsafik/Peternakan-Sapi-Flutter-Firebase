import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

// ignore: must_be_immutable
class BarcodePage extends StatelessWidget {
  BarcodePage({Key? key, this.document, this.data}) : super(key: key);
  var document = Get.arguments;
  final data;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: SizedBox(
        child: Column(
          children: [
            const SizedBox(height: 200),
            Text(data['name'].toString()),
            SizedBox(
              height: 350,
              child: SfBarcodeGenerator(
                value: data['nomortag'],
                symbology: QRCode(),
                showValue: true,
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
