import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCowController extends GetxController {
  late TextEditingController name = TextEditingController(text: '');
  late TextEditingController eartag = TextEditingController(text: '');
  late TextEditingController rasCow = TextEditingController(text: '');
  late TextEditingController gender = TextEditingController(text: '');
  late TextEditingController breed = TextEditingController(text: '');
  late TextEditingController birthdate = TextEditingController(text: '');
  late TextEditingController joinedwhen = TextEditingController(text: '');
  late TextEditingController note = TextEditingController(text: '');
  var selectedDate = DateTime.now().obs;
  var dateJoin = DateTime.now().obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addCow(
    String name,
    String eartag,
    String rasCow,
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
        "rasCow": rasCow,
        "gender": gender,
        "breed": breed,
        "birthdate": birthdate,
        "joinedwhen": joinedwhen,
        "note": note,
        "record": FieldValue.arrayUnion(
          [
            {
              "action": 'belum ada pencatatan',
              'date': '',
              'noted': '',
              'time': '',
            }
          ],
        ),
      });
      Get.defaultDialog(
        title: "berhasil",
        middleText: "berhasil menambahkan sapi",
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
        middleText: "tidak berhasil menambahkan sapi",
      );
    }
  }

  void cleartext() {}

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

  get chooseDate async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  get choosejoin async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: dateJoin.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != dateJoin.value) {
      dateJoin.value = pickedDate;
    }
  }
}
