import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailCowController extends GetxController {
  var currentUser = FirebaseAuth.instance.currentUser!.uid.obs;

  
}
