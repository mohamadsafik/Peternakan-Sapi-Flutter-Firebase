import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/firebase_constants.dart';

class UpdateCowController extends GetxController {
  late TextEditingController name = TextEditingController();
  late TextEditingController eartag = TextEditingController();
  late TextEditingController rasCow = TextEditingController();
  late TextEditingController gender = TextEditingController();
  late TextEditingController breed = TextEditingController();
  late TextEditingController birthdate = TextEditingController();
  late TextEditingController joinedwhen = TextEditingController();
  late TextEditingController note = TextEditingController();

  // Future<DocumentSnapshot<Object?>> getData(String docID) async {
  //   DocumentReference docRef = firestore.collection("cows").doc(docID);
  //   return docRef.get();
  // }

  void editCow(
    String name,
    String eartag,
    String rasCow,
    String gender,
    String breed,
    String birthdate,
    String joinedwhen,
    String note,
    String data,
  ) async {
    DocumentReference cows = firestore.collection("cows").doc(data);

    try {
      await cows.update({
        // "uid": FirebaseAuth.instance.currentUser!.uid,
        "name": name,
        "eartag": eartag,
        "rasCow": rasCow,
        "gender": gender,
        "breed": breed,
        "birthdate": birthdate,
        "joinedwhen": joinedwhen,
        "note": note,
      });
      Get.defaultDialog(
        title: "berhasil",
        middleText: "berhasil edit sapi",
        onConfirm: () {
          Get.back();
          Get.back();
        },
        textConfirm: "okay",
      );
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

  @override
  void onClose() {
    name.dispose();
    eartag.dispose();
    rasCow.dispose();
    gender.dispose();
    breed.dispose();
    birthdate.dispose();
    joinedwhen.dispose();
    note.dispose();
    super.onClose();
  }
}
