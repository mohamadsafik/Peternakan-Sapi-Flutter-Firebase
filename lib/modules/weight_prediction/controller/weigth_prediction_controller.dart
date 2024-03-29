import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:peternakan_sapi/constants/firebase_constants.dart';

class WeightPredictionController extends GetxController {
  late TextEditingController weight = TextEditingController();
  int firstFieldValue = 0;
  int secondFieldValue = 0;
  var dateformat = ("dd-MM-yyyy");

  editCow(
    String weight,
    String docID,
  ) async {
    DocumentReference cows = firestore.collection("cows").doc(docID);
    try {
      await cows.update({
        "weight": weight,
        "weights": FieldValue.arrayUnion([
          {
            "weight": weight,
            "date": DateFormat(dateformat).format(DateTime.now()),
            'time': DateTime.now(),
            "person": auth.currentUser?.email,
          }
        ]),
      });
      Get.back();
      Get.back();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.defaultDialog(
        title: "terjadi kesalahan",
        middleText: "tidak berhasil edit sapi",
      );
    }
  }
}
