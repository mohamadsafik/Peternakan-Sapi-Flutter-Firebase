import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/firebase_constants.dart';

class SettingController extends GetxController {
  late TextEditingController username = TextEditingController();
  late TextEditingController alamat = TextEditingController();
  late TextEditingController gender = TextEditingController();
  XFile? pickedImage;
  late ImagePicker imagePicker = ImagePicker();
  String? imageUrl;
  var items = ['Pria', 'Wanita'].obs;
  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  var stream = FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: auth.currentUser?.email)
      .snapshots();

  void updateProfile(
    String username,
    String alamat,
    String gender,
    String data,
  ) async {
    DocumentReference users = firestore.collection("users").doc(data);
    var nameImage = pickedImage?.name;
    var storageImage =
        FirebaseStorage.instance.ref().child('userImage/$nameImage');
    if (pickedImage == null) {
      imageUrl = null;
    } else {
      var task = storageImage.putFile(File(pickedImage!.path));
      imageUrl = await (await task).ref.getDownloadURL();
    }
    try {
      await users.update({
        "image": (imageUrl == null) ? "" : imageUrl,
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "username": username,
        "alamat": alamat,
        "gender": gender,
      });
      Get.defaultDialog(
        title: "berhasil",
        middleText: "berhasil Merubah Data",
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
        middleText: "tidak berhasil Merubah",
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
}
