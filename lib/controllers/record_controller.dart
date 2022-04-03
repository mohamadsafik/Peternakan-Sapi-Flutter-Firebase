import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/firebase_constants.dart';

class RecordController extends GetxController {
  late TextEditingController name = TextEditingController();
  late TextEditingController eartag = TextEditingController();
  late TextEditingController rasCow = TextEditingController();
  late TextEditingController gender = TextEditingController();
  late TextEditingController breed = TextEditingController();
  late TextEditingController birthdate = TextEditingController();
  late TextEditingController joinedwhen = TextEditingController();
  late TextEditingController note = TextEditingController();
  late TextEditingController time = TextEditingController();

  var items = ['Jantan', 'Betina'].obs;
  var aksi = [
    'Inseminasi Buatan',
    'Vaksin',
    'Sakit',
  ].obs;
  var selectedDate = DateTime.now().obs;
  var dateJoin = DateTime.now().obs;
  void cleartext() {
    name.clear();
    eartag.clear();
    rasCow.clear();
    gender.clear();
    breed.clear();
    birthdate.clear();
    joinedwhen.clear();
    note.clear();
  }

  void recordCow(
    String name,
    String eartag,
    String note,
    String time,
    String docID,
    String text,
  ) async {
    DocumentReference cows = firestore.collection("cows").doc(docID);

    try {
      await cows.update(
        {
          "record": FieldValue.arrayUnion(
            [
              {
                "action": name,
                'date': eartag,
                'noted': note,
                'time': DateTime.now(),
              }
            ],
          )
        },
      );
      Get.defaultDialog(
        barrierDismissible: true,
        title: "berhasil",
        middleText: "berhasil record sapi",
        onConfirm: () {
          Get.back();
          Get.back();
          cleartext();
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
    time.dispose();
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
