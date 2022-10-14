import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peternakan_sapi/models/cow.dart';

import '../../../../constants/firebase_constants.dart';

class UpdateCowController extends GetxController {
  late TextEditingController name = TextEditingController();
  late TextEditingController rasCow = TextEditingController();
  late TextEditingController gender = TextEditingController();
  late TextEditingController breed = TextEditingController();
  late TextEditingController birthdate = TextEditingController();
  late TextEditingController joinedwhen = TextEditingController();
  late TextEditingController note = TextEditingController();
  late TextEditingController nomortag = TextEditingController();
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
  XFile? pickedImage;
  late ImagePicker imagePicker = ImagePicker();
  String? imageUrl;

  // Future<DocumentSnapshot<Object?>> getData(String docID) async {
  //   DocumentReference docRef = firestore.collection("cows").doc(docID);
  //   return docRef.get();
  // }

  void editCow(
      CowModel cowModel,
      // String name,
      // String rasCow,
      // String gender,
      // String breed,
      // String birthdate,
      // String joinedwhen,
      // String note,
      String data) async {
    DocumentReference cows = firestore.collection("cows").doc(data);
    var nameImage = pickedImage?.name;
    var storageImage =
        FirebaseStorage.instance.ref().child('cowsImage/$nameImage');
    if (pickedImage == null) {
      imageUrl = null;
    } else {
      //jika image tidak kosong maka image = url gambar
      var task = storageImage.putFile(File(pickedImage!.path));
      imageUrl = await (await task).ref.getDownloadURL();
    }
    try {
      (imageUrl != null)
          ? await cows.update({
              // "uid": FirebaseAuth.instance.currentUser!.uid,
              "image": imageUrl,
              "name": cowModel.name,
              "rasCow": cowModel.rasCow,
              "nomortag": cowModel.nomortag,
              "gender": cowModel.gender,
              "breed": cowModel.breed,
              "birthdate": cowModel.birthdate,
              "joinedwhen": cowModel.joinedwhen,
              "note": cowModel.note,
            })
          : await cows.update({
              // "uid": FirebaseAuth.instance.currentUser!.uid,
              "name": cowModel.name,
              "rasCow": cowModel.rasCow,
              "nomortag": cowModel.nomortag,
              "gender": cowModel.gender,
              "breed": cowModel.breed,
              "birthdate": cowModel.birthdate,
              "joinedwhen": cowModel.joinedwhen,
              "note": cowModel.note,
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

  void cancelImage() async {
    pickedImage = null;
    update();
  }

  void getImage() async {
    try {
      final checkImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (checkImage != null) {
        pickedImage = checkImage;
      }
      update();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      update();
    }
  }

  @override
  void onClose() {
    name.dispose();
    rasCow.dispose();
    gender.dispose();
    breed.dispose();
    birthdate.dispose();
    joinedwhen.dispose();
    note.dispose();
    super.onClose();
  }
}
