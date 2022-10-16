import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../constants/firebase_constants.dart';

class UpdateRecordPage extends StatefulWidget {
  const UpdateRecordPage({Key? key, record}) : super(key: key);

  @override
  State<UpdateRecordPage> createState() => _UpdateRecordPageState();
}

class _UpdateRecordPageState extends State<UpdateRecordPage> {
  var record = Get.arguments;
  late TextEditingController action = TextEditingController();
  late TextEditingController status = TextEditingController();
  late TextEditingController date = TextEditingController();
  late TextEditingController diagnosis = TextEditingController();
  late TextEditingController vaksin = TextEditingController();
  late TextEditingController doctor = TextEditingController();
  late TextEditingController note = TextEditingController();
  late TextEditingController straw = TextEditingController();
  late TextEditingController inseminator = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          TextField(
            controller: action..text = record['action'],
          ),
          TextField(
            controller: date..text = record['date'],
          ),
          TextField(
            controller: doctor..text = record['doctor'],
          ),
          TextField(
            controller: note..text = record['noted'],
          ),
          ElevatedButton(
            onPressed: () {
              print(record);
              // void recordCow() async {
              //   DocumentReference cows =
              //       firestore.collection("cows").doc(data.id);
              //   try {
              //     await cows.update(
              //       {
              //         "record": FieldValue.arrayRemove(
              //           [record],
              //         )
              //       },
              //     );
              //     Get.defaultDialog(
              //       barrierDismissible: true,
              //       title: "berhasil",
              //       middleText: "berhasil record sapi",
              //       onConfirm: () {
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
              //       middleText: "tidak berhasil edit sapi",
              //     );
              //   }
              // }

              // recordCow();
            },
            child: Text('data'),
          )
        ]));
  }
}
