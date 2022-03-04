import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCowController extends GetxController {
  late TextEditingController name = TextEditingController();
  late TextEditingController eartag = TextEditingController();
  late TextEditingController code = TextEditingController();
  late TextEditingController gender = TextEditingController();
  late TextEditingController breed = TextEditingController();
  late TextEditingController birthdate = TextEditingController();
  late TextEditingController joinedwhen = TextEditingController();
  late TextEditingController note = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<DocumentSnapshot<Object?>> getData(String docID) async {
  //   DocumentReference docRef = firestore.collection("cows").doc(docID);
  //   return docRef.get();
  // }

  void editCow(
    String name,
    String eartag,
    String code,
    String gender,
    String breed,
    String birthdate,
    String joinedwhen,
    String note,
    String docID,
  ) async {
    DocumentReference cows = firestore.collection("cows").doc(docID);

    try {
      await cows.update({
        // "uid": FirebaseAuth.instance.currentUser!.uid,
        "name": name,
        "eartag": eartag,
        "code": code,
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
      print(e);
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
    code.dispose();
    gender.dispose();
    breed.dispose();
    birthdate.dispose();
    joinedwhen.dispose();
    note.dispose();
    super.onClose();
  }
}
