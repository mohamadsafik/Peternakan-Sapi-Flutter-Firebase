import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/reusable_method/scanner.dart';
import '../../../../constants/firebase_constants.dart';

class ListCowEmployeeController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  ScanQrcode scanner = ScanQrcode();
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

  var stream =
      FirebaseFirestore.instance.collection('cows').orderBy('name').snapshots();
}
