import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import '../routes/route_name.dart';

class ScanQrcode {
  Future<void> scanBarcode(
      context, AsyncSnapshot<QuerySnapshot> streamSnapshot) async {
    String data;
    try {
      data = await FlutterBarcodeScanner.scanBarcode("", "", true, ScanMode.QR);
      if (data != null) {
        for (int i = 0; i < streamSnapshot.data!.docs.length; i++) {
          if (data == streamSnapshot.data!.docs[i]["eartag"]) {
            Get.toNamed(
              RouteName.detailcow,
              arguments: streamSnapshot.data!.docs[i].data(),
            );
          }
        }
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal mengambil data",
      );
    }
  }
}
