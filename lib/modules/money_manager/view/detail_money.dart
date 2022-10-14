import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/modules/money_manager/view/update_money.dart';


import '../../../constants/firebase_constants.dart';

class DetailMoney extends StatelessWidget {
  DetailMoney({Key? key, this.data}) : super(key: key);
  final data;

  void deleteMoney(String data) async {
    try {
      DocumentReference money = firestore.collection("money").doc(data);

      Get.defaultDialog(
          title: "Hapus data",
          middleText: "Apakah Anda yakin menghapus data ini ?",
          onConfirm: () {
            money.delete();
            Get.back();
            Get.back();
          },
          textConfirm: "YES",
          textCancel: "NO");
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal menghapus data",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(EditMoneyManager(
                  data: data,
                ));
              },
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                deleteMoney(data.id);
              },
              icon: Icon(Icons.delete)),
        ],
      ),
      backgroundColor: background,
      body: Container(
          child: Column(
        children: [Text(data['total'])],
      )),
    );
  }
}
