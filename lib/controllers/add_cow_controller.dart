import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddCowController extends GetxController {
  late TextEditingController name = TextEditingController();
  late TextEditingController eartag = TextEditingController();
  late TextEditingController rasCow = TextEditingController();
  late TextEditingController gender = TextEditingController();
  late TextEditingController breed = TextEditingController();
  late TextEditingController birthdate = TextEditingController();
  late TextEditingController joinedwhen = TextEditingController();
  late TextEditingController note = TextEditingController();
  var selectedDate = DateTime.now().obs;
  var dateJoin = DateTime.now().obs;
  var items = ['Jantan', 'Betina'].obs;
  var ras = [
    'Sapi Limousin',
    'Sapi Simental',
    'Sapi Brahman',
    'Sapi Brangus',
    'Sapi Ongole',
    'Sapi Belgian Blue',
    'Sapi Madura',
    'Sapi Bali',
    'Sapi Pegon'
  ].obs;

  FirebaseStorage storage = FirebaseStorage.instance;

  File? photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      photo = File(pickedFile.path);
      uploadFile();
    } else {
      const Text('No image selected.');
    }
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      photo = File(pickedFile.path);
      uploadFile();
    } else {
      const Text('No image selected.');
    }
  }

  Future uploadFile() async {
    if (photo == null) return;
    final fileName = basename(photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = FirebaseStorage.instance.ref(destination).child('file/');
      await ref.putFile(photo!);
    } catch (e) {
      const Text('error');
    }
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
//cleartext after press okay
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
        // "image": ,
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
            // {
            //   "action": '',
            //   'date': '',
            //   'noted': '',
            //   'time': DateTime.now(),
            // }
          ],
        ),
      });
      Get.defaultDialog(
        barrierDismissible: false,
        title: "berhasil",
        middleText: "berhasil menambahkan sapi",
        onConfirm: () {
          cleartext();
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
        middleText: "tidak berhasil menambahkan sapi",
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
