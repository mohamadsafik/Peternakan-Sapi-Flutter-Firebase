import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/firebase_constants.dart';

class MoneyManagerController extends GetxController {
  late TextEditingController note = TextEditingController();
  late TextEditingController total = TextEditingController();
  late TextEditingController date = TextEditingController();
  late TextEditingController action = TextEditingController();
  var aksi = ['Pemasukan', 'Pengeluaran'].obs;

  var selectedDate = DateTime.now().obs;
  var dateJoin = DateTime.now().obs;

  void addmoney(String note, String date, String action, String total) async {
    CollectionReference money = firestore.collection("money");
    try {
      await money.add({
        "note": note,
        "total": total,
        'date': date,
        'action': action,
        'time': DateTime.now(),
        'uid': auth.currentUser?.uid
      });
      Get.defaultDialog(
        barrierDismissible: true,
        title: "berhasil",
        middleText: "",
        onConfirm: () {
          Get.back();
          Get.back();
          Get.back();
          // cleartext();
        },
        textConfirm: "okay",
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.defaultDialog(
        title: "terjadi kesalahan",
        middleText: "",
      );
    }
  }

  @override
  void onClose() {
    action.dispose();
    note.dispose();
    total.dispose();
    date.dispose();
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
}
