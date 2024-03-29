import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/firebase_constants.dart';

class CreateProfileEmployeeController extends GetxController {
  late TextEditingController username = TextEditingController();
  late TextEditingController alamat = TextEditingController();
  late TextEditingController gender = TextEditingController();
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
    String data,
  ) async {
    DocumentReference users = firestore.collection("users").doc(data);

    try {
      await users.update({
        "uid": FirebaseAuth.instance.currentUser!.uid,
      });
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
}
