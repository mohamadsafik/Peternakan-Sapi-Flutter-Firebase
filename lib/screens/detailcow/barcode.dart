import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

// ignore: must_be_immutable
class BarcodePage extends StatelessWidget {
  BarcodePage({Key? key, this.document}) : super(key: key);
  var document = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: SizedBox(
        child: Column(
          children: [
            const SizedBox(height: 200),
            Text(document['name']),
            SizedBox(
              height: 200,
              child: SfBarcodeGenerator(
                value: document.id,
                // symbology: QRCode(),
                showValue: true,
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
