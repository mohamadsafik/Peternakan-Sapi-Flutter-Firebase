import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/firebase_constants.dart';

class RecordController extends GetxController {
  late TextEditingController action = TextEditingController();
  late TextEditingController status = TextEditingController();
  late TextEditingController date = TextEditingController();
  late TextEditingController diagnosis = TextEditingController();
  late TextEditingController vaksin = TextEditingController();
  late TextEditingController doctor = TextEditingController();
  late TextEditingController note = TextEditingController();
  late TextEditingController straw = TextEditingController();
  late TextEditingController inseminator = TextEditingController();
  late TextEditingController gestationalage = TextEditingController();

  var items = ['Jantan', 'Betina'].obs;
  var pregnant = ['Hamil', 'Tidak'].obs;
  var aksi = ['Inseminasi Buatan', 'Vaksin', 'Sakit', 'Hamil'].obs;
  var selectedDate = DateTime.now().obs;
  var dateJoin = DateTime.now().obs;
  void cleartext() {
    action.clear();

    straw.clear();
  }

  void recordVaksin(
    String action,
    String vaksin,
    String date,
    String doctor,
    String note,
    String docID,
    String text,
  ) async {
    DocumentReference cows = firestore.collection("cows").doc(docID);
    try {
      await cows.update(
        {
          "vaksin": vaksin,
          "record": FieldValue.arrayUnion(
            [
              {
                "action": action,
                'vaksin': vaksin,
                'date': date,
                'doctor': doctor,
                'noted': note,
                'time': DateTime.now(),
                "person": auth.currentUser?.email,
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

  void recordSakit(
    String action,
    String diagnosis,
    String date,
    String doctor,
    String note,
    String docID,
    String text,
  ) async {
    DocumentReference cows = firestore.collection("cows").doc(docID);
    try {
      await cows.update(
        {
          "statussick": 'Sakit',
          "record": FieldValue.arrayUnion(
            [
              {
                "action": action,
                'diagnosis': diagnosis,
                'date': date,
                'doctor': doctor,
                'noted': note,
                'time': DateTime.now(),
                "person": auth.currentUser?.email,
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

  void recordPregnant(
    String status,
    String action,
    String date,
    String straw,
    String inseminator,
    String gestationalage,
    String docID,
    String text,
  ) async {
    DocumentReference cows = firestore.collection("cows").doc(docID);

    try {
      await cows.update(
        {
          "statuspregnant": status,
          "record": FieldValue.arrayUnion(
            [
              {
                "action": action,
                'date': date,
                'kandungan': gestationalage,
                'noted': straw,
                'doctor': inseminator,
                'time': DateTime.now(),
                "person": auth.currentUser?.email,
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

  void recordCow(
    String status,
    String action,
    String date,
    String straw,
    String inseminator,
    String docID,
    String text,
  ) async {
    DocumentReference cows = firestore.collection("cows").doc(docID);

    try {
      await cows.update(
        {
          "statuspregnant": 'IB',
          "record": FieldValue.arrayUnion(
            [
              {
                "action": action,
                'date': date,
                'noted': straw,
                'doctor': inseminator,
                'time': DateTime.now(),
                "person": auth.currentUser?.email,
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
    action.dispose();
    date.dispose();
    straw.dispose();
    inseminator.dispose();
    vaksin.dispose();
    doctor.dispose();
    note.dispose();
    diagnosis.dispose();
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
