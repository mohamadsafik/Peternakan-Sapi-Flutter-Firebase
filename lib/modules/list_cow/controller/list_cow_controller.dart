import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/reusable_method/scanner.dart';
import '../../../constants/firebase_constants.dart';
import '../../../routes/route_name.dart';

class ListCowController extends GetxController {
  ScanQrcode scanner = ScanQrcode();
  final TextEditingController searchController = TextEditingController();

  late QuerySnapshot snapshotData;

  bool isExecuted = false;

  Future getData(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot =
        await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }

  Future queryData(String querystring) async {
    return FirebaseFirestore.instance
        .collection('cows')
        .where('name', isGreaterThanOrEqualTo: querystring)
        .where('uid', isEqualTo: auth.currentUser?.uid)
        .get();
  }

  void deleteSapi(String docID) async {
    try {
      DocumentReference cows = firestore.collection("cows").doc(docID);

      Get.defaultDialog(
          title: "Hapus data",
          middleText: "Apakah Anda yakin menghapus data ini ?",
          onConfirm: () {
            cows.delete();
            Get.back();
          },
          textConfirm: "YES",
          textCancel: "NO");
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal menghapus data",
      );
    }
  }

  var stream = FirebaseFirestore.instance
      .collection('cows')
      .orderBy('name')
      .where('uid', isEqualTo: auth.currentUser?.uid)
      .snapshots();

  querydataEmployee(String text) {}
}
