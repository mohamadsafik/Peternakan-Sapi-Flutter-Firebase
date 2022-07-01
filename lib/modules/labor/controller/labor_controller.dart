import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../constants/firebase_constants.dart';

class LaborController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController role = TextEditingController();

  void registerLabor(String email, String password) async {
    CollectionReference cows = firestore.collection("users");
    FirebaseApp app = await Firebase.initializeApp(
        name: 'Secondary', options: Firebase.app().options);
    try {
      await FirebaseAuth.instanceFor(app: app)
          .createUserWithEmailAndPassword(email: email, password: password);
      await cows.add({
        "email": email,
        "password": password,
        "uidowner": auth.currentUser?.uid,
        "role": "employee"
      });
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      if (kDebugMode) {
        print(e.message);
      }
      // Get.snackbar("Error", e.message!);
      Get.snackbar(
        "Error",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      // this is temporary. you can handle different kinds of activities
      //such as dialogue to indicate what's wrong
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  var stream = FirebaseFirestore.instance
      .collection('users')
      // .orderBy('name')
      .where('uidowner', isEqualTo: auth.currentUser?.uid)
      .snapshots();
}
