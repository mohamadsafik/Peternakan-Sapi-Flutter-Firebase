import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../constants/color.dart';
import '../../../constants/firebase_constants.dart';
import '../controller/detail_cow_controller.dart';
import '../widgets/barcode_cow.dart';
import '../widgets/cow_information.dart';
import '../widgets/image_show.dart';
import '../widgets/record_history.dart';
import '../widgets/weight_record.dart';

// ignore: must_be_immutable
class DetailCowPage extends StatelessWidget {
  DetailCowPage({Key? key, data}) : super(key: key);
  final controller = Get.find<DetailCowController>();

  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext bc) {
                      return ImageShow(data: data);
                    });
              },
              child: Stack(
                children: [
                  data['image'] != null
                      ? SizedBox(
                          width: 400,
                          height: 250,
                          child: Image.network(
                            data['image'],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )
                      : SizedBox(
                          width: 400,
                          height: 250,
                          child: SvgPicture.asset(
                            'assets/listcow/default.svg',
                            fit: BoxFit.cover,
                          ),
                        )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16.0,
                left: 12.0,
                right: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data['statuspregnant'].toString(),
                              style: const TextStyle(color: Colors.orange),
                            ),
                          ),
                          (data['statuspregnant'] != "")
                              ? IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      barrierDismissible: false,
                                      title: "Sapi Hamil",
                                      middleText: "Hapus Status Hamil",
                                      onCancel: () {},
                                      onConfirm: () async {
                                        DocumentReference cows = firestore
                                            .collection("cows")
                                            .doc(data.id);

                                        try {
                                          await cows.update({
                                            // "uid": FirebaseAuth.instance.currentUser!.uid,
                                            "statuspregnant": '',
                                          });
                                          Get.back();
                                        } catch (e) {
                                          if (kDebugMode) {
                                            print(e);
                                          }
                                          Get.defaultDialog(
                                            title: "terjadi kesalahan",
                                            middleText:
                                                "tidak berhasil edit status sapi",
                                          );
                                        }
                                      },
                                    );
                                  },
                                )
                              : const SizedBox(
                                  height: 0,
                                ),
                          Text(
                            data['statussick'].toString(),
                            style: const TextStyle(color: Colors.red),
                          ),
                          (data['statussick'] != "")
                              ? IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      barrierDismissible: false,
                                      title: "Sapi Sakit",
                                      middleText: "Sapi Sudah Sembuh?",
                                      onCancel: () {},
                                      onConfirm: () async {
                                        DocumentReference cows = firestore
                                            .collection("cows")
                                            .doc(data.id);
                                        try {
                                          await cows.update({
                                            "statussick": '',
                                          });
                                          Get.back();
                                        } catch (e) {
                                          if (kDebugMode) {
                                            print(e);
                                          }
                                          Get.defaultDialog(
                                            title: "terjadi kesalahan",
                                            middleText:
                                                "tidak berhasil edit status sapi",
                                          );
                                        }
                                      },
                                    );
                                  },
                                )
                              : const SizedBox(
                                  height: 0,
                                ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              showCupertinoModalPopup(
                                  context: context,
                                  builder: (BuildContext bc) {
                                    return BarcodePage(
                                      data: data,
                                    );
                                  });
                            },
                            child: const Icon(
                              Icons.qr_code,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CowInformation(data: data),
                  const SizedBox(
                    height: 10,
                  ),
                  record_history(
                      data: data,
                      currentUser: controller.currentUser.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  WeightRecord(
                      data: data,
                      currentUser: controller.currentUser.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
