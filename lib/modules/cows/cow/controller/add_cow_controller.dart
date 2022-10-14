import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peternakan_sapi/models/cow.dart';
import '../../../../../../constants/firebase_constants.dart';
import 'package:uuid/uuid.dart';

class AddCowController extends GetxController {
  late TextEditingController name = TextEditingController();
  late TextEditingController nomortag = TextEditingController();
  late TextEditingController rasCow = TextEditingController();
  late TextEditingController gender = TextEditingController();
  late TextEditingController breed = TextEditingController();
  late TextEditingController birthdate = TextEditingController();
  late TextEditingController joinedwhen = TextEditingController();
  late TextEditingController note = TextEditingController();
  late TextEditingController weight = TextEditingController();
  final RxBool validate = false.obs;
  var uuid = const Uuid();
  XFile? pickedImage;
  late ImagePicker imagePicker = ImagePicker();
  String? imageUrl;
  var dateformat = ("dd-MM-yyyy");
  var selectedDate = DateTime.now().obs;
  var dateJoin = DateTime.now().obs;
  var items = ['Jantan', 'Betina'].obs;
  var ras = [
    'Sapi Limousin',
    'Sapi Simental',
    'Sapi Brahman',
    'Sapi Brangus',
    'Sapi Ongole',
    'Sapi Belgian Blue',
    'Sapi Madura',
    'Sapi Bali',
    'Sapi Pegon'
  ].obs;

  void cleartext() {
    name.clear();
    nomortag.clear();
    rasCow.clear();
    gender.clear();
    breed.clear();
    birthdate.clear();
    joinedwhen.clear();
    note.clear();
  }

  void addCowModel(CowModel cowModel, String weight,
      {required Text child}) async {
    CollectionReference cows = firestore.collection("cows");
    var nameImage = pickedImage?.name;
    var storageImage =
        FirebaseStorage.instance.ref().child('cowsImage/$nameImage');
    if (pickedImage == null) {
      imageUrl = null;
    } else {
      //jika image tidak kosong maka image = url gambar
      var task = storageImage.putFile(File(pickedImage!.path));
      imageUrl = await (await task).ref.getDownloadURL();
    }
    try {
      await cows.add({
        "image": imageUrl,
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "name": cowModel.name,
        "nomortag": cowModel.nomortag,
        "eartag": uuid.v1(),
        "rasCow": cowModel.rasCow,
        "gender": cowModel.gender,
        "breed": cowModel.breed,
        "birthdate": cowModel.birthdate,
        "joinedwhen": cowModel.joinedwhen,
        "note": cowModel.note,
        "statuspregnant": '',
        "statussick": '',
        "weight": weight,
        "record": FieldValue.arrayUnion(
          [],
        ),
        "weights": FieldValue.arrayUnion(
          [],
        )
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

  @override
  void onClose() {
    name.dispose();
    nomortag.dispose();
    rasCow.dispose();
    gender.dispose();
    breed.dispose();
    birthdate.dispose();
    joinedwhen.dispose();
    note.dispose();
    super.onClose();
  }

  get chooseDate async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  DateTime? pickedDate;
  get choosejoin async {
    pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: dateJoin.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != dateJoin.value) {
      dateJoin.value = pickedDate!;
    }
  }
}
 // void addCow(
  //   String name,
  //   String rasCow,
  //   String gender,
  //   String breed,
  //   String birthdate,
  //   String joinedwhen,
  //   String note,
  // ) async {
  //   CollectionReference cows = firestore.collection("cows");
  //   var nameImage = pickedImage?.name;
  //   var storageImage =
  //       FirebaseStorage.instance.ref().child('cowsImage/$nameImage');
  //   if (pickedImage == null) {
  //     imageUrl = null;
  //   } else {
  //     //jika image tidak kosong maka image = url gambar
  //     var task = storageImage.putFile(File(pickedImage!.path));
  //     imageUrl = await (await task).ref.getDownloadURL();
  //   }
  //   try {
  //     await cows.add({
  //       "image": imageUrl,
  //       "uid": FirebaseAuth.instance.currentUser!.uid,
  //       "name": name,
  //       "eartag": uuid.v1(),
  //       "rasCow": rasCow,
  //       "gender": gender,
  //       "breed": breed,
  //       "birthdate": birthdate,
  //       "joinedwhen": joinedwhen,
  //       "note": note,
  //       "record": FieldValue.arrayUnion(
  //         [],
  //       ),
  //       "weights": FieldValue.arrayUnion(
  //         [],
  //       ),
  //     });
  //     Get.defaultDialog(
  //       barrierDismissible: false,
  //       title: "berhasil",
  //       middleText: "berhasil menambahkan sapi",
  //       onConfirm: () {
  //         cleartext();
  //         Get.back();
  //         Get.back();
  //       },
  //       textConfirm: "okay",
  //     );
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //     Get.defaultDialog(
  //       title: "terjadi kesalahan",
  //       middleText: "tidak berhasil menambahkan sapi",
  //     );
  //   }
  // }