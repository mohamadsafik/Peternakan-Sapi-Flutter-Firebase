import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/firebase_constants.dart';
import 'package:peternakan_sapi/reusable_method/scanner.dart';

class HomeController extends GetxController {
  final ScanQrcode scanner = ScanQrcode();

  // var scan = scanner.scanBarcode(context, streamSnapshot)

  Future<int> productsRef = FirebaseFirestore.instance
      .collection("cows")
      .doc()
      // .where('uid', isEqualTo: auth.currentUser?.uid)
      .snapshots()
      .length;

  var stream = FirebaseFirestore.instance
      .collection('cows')
      // .orderBy('name')
      .where('uid', isEqualTo: auth.currentUser?.uid)
      .snapshots();
}
