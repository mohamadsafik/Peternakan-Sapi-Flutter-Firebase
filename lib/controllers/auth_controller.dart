import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/constants/firebase_constants.dart';
import 'package:peternakan_sapi/controllers/setting_controller.dart';
import 'package:peternakan_sapi/modules/cow-record/list_cow/list_cows.dart';
import 'package:peternakan_sapi/modules/employee/create_profile_employee.dart';
import 'package:peternakan_sapi/modules/employee/home_employee.dart';
import 'package:peternakan_sapi/modules/landing/landing.dart';
import 'package:peternakan_sapi/routes/route_name.dart';
import 'package:get/get.dart';

import '../modules/auth/auth_main.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final namefarm = TextEditingController();
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    if (user != null) {
      var data = FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser?.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          if (documentSnapshot['role'] == 'owner') {
            Get.offAllNamed(RouteName.landing);
          } else {
            Get.offAllNamed(RouteName.setting);
          }
          print('Document data: ${documentSnapshot.data()}');
          print(documentSnapshot['role']);
        } else {
          // Get.offAllNamed(RouteName.landing);
          // Get.offAll(CreateProfileUpdate());
          Get.offAllNamed(RouteName.createprofile);

          print('Document does not exist on the database');
        }
      });
    } else {
      // user is null as in user is not available or not logged in
      // Get.offAllNamed(RouteName.login);
      Get.to(const AuthMainPage());
    }
  }

  // void profile(String username, String )async{
  //    CollectionReference users = firestore.collection("users");
  // }

  void register(
      String email, String password, String namefarm, String username) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final uid = auth.currentUser?.uid;
      DocumentReference users = firestore.collection("users").doc(uid);
      await users.set({
        "username": username,
        "namefarm": namefarm,
        "email": email,
        "password": password,
        "uid": auth.currentUser?.uid,
        "role": "owner",
        "image": "",
      });
      authInstance.signOut();
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

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      return Get.defaultDialog(
          title: 'info', content: const Text('terjadi kesalahan login'));
      // if (kDebugMode) {
      //   print(e.message);
      // }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();

  void handleSignIn() async {
    try {
      await googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }
}
