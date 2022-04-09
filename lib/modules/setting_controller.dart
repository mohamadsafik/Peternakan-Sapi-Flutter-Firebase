import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../constants/firebase_constants.dart';

class SettingController extends GetxController {
  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
