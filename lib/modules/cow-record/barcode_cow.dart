import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

// ignore: must_be_immutable
class BarcodePage extends StatelessWidget {
  BarcodePage({Key? key, this.document, this.data}) : super(key: key);
  var document = Get.arguments;
  final data;

  GlobalKey globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
      child: Column(
        children: [
          const SizedBox(height: 200),
          SizedBox(
              height: 550,
              // child: SfBarcodeGenerator(
              //   value: data['nomortag'],
              //   symbology: QRCode(),
              //   showValue: true,
              // ),
              child: Column(
                children: [
                  Text(data['name'].toString()),
                  SizedBox(
                    height: 20,
                  ),
                  QrImage(
                    data: data['eartag'].toString(),
                    version: QrVersions.auto,
                    size: 300.0,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(data['nomortag'].toString()),
                  SizedBox(
                    height: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.snackbar('qrcode', 'download Berhasil',
                            icon: Icon(Icons.done),
                            backgroundColor: Colors.white,
                            duration: Duration(seconds: 2));
                      },
                      icon: Icon(
                        Icons.download,
                        color: green,
                      ))
                ],
              )),
        ],
      ),
    )));
  }
}
