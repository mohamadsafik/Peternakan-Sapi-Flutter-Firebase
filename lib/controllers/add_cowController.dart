import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCowController extends GetxController {
  late TextEditingController name;
  late TextEditingController eartag;
  late TextEditingController code;
  late TextEditingController gender;
  late TextEditingController breed;
  late TextEditingController birthdate;
  late TextEditingController joinedwhen;
  late TextEditingController note;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void addCow(
    String name,
    String eartag,
    String code,
    String gender,
    String breed,
    String birthdate,
    String joinedwhen,
    String note,
  ) async {
    CollectionReference cows = firestore.collection("cows");
    try {
      await cows.add({
        "uid": FirebaseAuth.instance.currentUser!.uid,
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
        middleText: "berhasil menambahkan sapi",
        // onConfirm: () => Get.back(),
        textConfirm: "okay",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "terjadi kesalahan",
        middleText: "tidak berhasil menambahkan sapi",
      );
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    eartag = TextEditingController();
    code = TextEditingController();
    gender = TextEditingController();
    breed = TextEditingController();
    birthdate = TextEditingController();
    joinedwhen = TextEditingController();
    note = TextEditingController();
    super.onInit();
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
