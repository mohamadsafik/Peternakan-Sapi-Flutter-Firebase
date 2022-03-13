import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ListCowController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<QuerySnapshot<Object?>> getData() async {
  //   CollectionReference products = firestore.collection("products");
  //   return products.get();
  // }

  // Stream<QuerySnapshot<Object?>> streamData() {
  //   CollectionReference products = firestore.collection("products");
  //   return products
  //       .where("price", isGreaterThan: 10000)
  //       // .orderBy("time", descending: true)
  //       .snapshots();
  // }

  void deleteSapi(String docID) async {
    try {
      DocumentReference cows = firestore.collection("cows").doc(docID);

      Get.defaultDialog(
          title: "Hapus data",
          middleText: "Apakah Anda yakin menghapus data ini ?",
          onConfirm: () {
            cows.delete();
            Get.back();
          },
          textConfirm: "YES",
          textCancel: "NO");
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal menghapus data",
      );
    }
  }
}
