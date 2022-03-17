import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateTaskController extends GetxController {
  late TextEditingController name = TextEditingController();
  late TextEditingController eartag = TextEditingController();
  late TextEditingController rasCow = TextEditingController();
  late TextEditingController gender = TextEditingController();
  late TextEditingController breed = TextEditingController();
  late TextEditingController birthdate = TextEditingController();
  late TextEditingController joinedwhen = TextEditingController();
  late TextEditingController note = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var selectedDate = DateTime.now().obs;
  var dateJoin = DateTime.now().obs;

  // Future<DocumentSnapshot<Object?>> getData(String docID) async {
  //   DocumentReference docRef = firestore.collection("cows").doc(docID);
  //   return docRef.get();
  // }

  void editCow(
    String name,
    String eartag,
    String note,
    String docID,
    String text,
  ) async {
    DocumentReference cows = firestore.collection("cows").doc(docID);

    try {
      await cows.update({
        // "uid": FirebaseAuth.instance.currentUser!.uid,
        "1.date": name,
        "1.kegiatan": eartag,
        "1.note": note
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
