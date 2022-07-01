import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:peternakan_sapi/constants/firebase_constants.dart';
import 'package:peternakan_sapi/modules/auth/view/auth_main.dart';
import 'package:peternakan_sapi/routes/route_name.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      // user is logged in
      Get.offAllNamed(RouteName.landing);
    } else {
      // user is null as in user is not available or not logged in
      // Get.offAllNamed(RouteName.login);
      Get.to(AuthMainPage());
    }
  }

  void register(String email, String password) async {
    CollectionReference users = firestore.collection("users");
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      authInstance.signOut();
      await users.add({
        "email": email,
        "password": password,
        "uid": auth.currentUser?.uid,
        "role": "owner"
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
