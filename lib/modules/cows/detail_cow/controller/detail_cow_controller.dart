import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailCowController extends GetxController {
  var currentUser = FirebaseAuth.instance.currentUser!.uid.obs;
  var dt = DateFormat("dd-MM-yyyy").format(DateTime.now()).obs;
}
