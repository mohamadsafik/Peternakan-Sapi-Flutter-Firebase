import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../constants/firebase_constants.dart';

class SocialMediaController extends GetxController {
  late TextEditingController status = TextEditingController();
  XFile? pickedImage;
  late ImagePicker imagePicker = ImagePicker();
  String? imageUrl;
  RxInt like = 0.obs;

  bool click = false;
  void getLike() {
    if (click == false) {
      like - 1;
    } else {
      like + 1;
    }
  }

  //like unlike button
  void likeUnlike() {
    click = !click;
    getLike();
  }

  void cleartext() {
    status.clear();
  }

  

  void addStatus(
    String status,
  ) async {
    CollectionReference post = firestore.collection("post");
    var nameImage = pickedImage?.name;
    var storageImage =
        FirebaseStorage.instance.ref().child('statusImage/$nameImage');
    if (pickedImage == null) {
      imageUrl = null;
    } else {
      //jika image tidak kosong maka image = url gambar
      var task = storageImage.putFile(File(pickedImage!.path));
      imageUrl = await (await task).ref.getDownloadURL();
    }
    try {
      await post.add({
        "grup": "peternakan sapi indonesia",
        // "username": stream,
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "status": status,
        "image": imageUrl,
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "date": DateFormat("d MMMM yyyy").format(DateTime.now()),
        "comments": FieldValue.arrayUnion(
          [],
        ),
        "like": FieldValue.arrayUnion(
          [],
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
    status.dispose();
    super.onClose();
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
