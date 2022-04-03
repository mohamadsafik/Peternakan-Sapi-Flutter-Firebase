import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../constants/firebase_constants.dart';

class ListCowController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var currentUser = auth.currentUser!.uid;

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
}
