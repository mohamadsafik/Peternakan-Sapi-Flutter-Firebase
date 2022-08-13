import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/cow-record/barcode_cow.dart';
import 'package:peternakan_sapi/modules/cow-record/detail_cow/widgets/weight_record.dart';
import '../../../constants/color.dart';
import '../../../controllers/detail_cow_controller.dart';
import '../record_weight_prediction.dart';
import 'widgets/cow_information.dart';
import 'widgets/image_show.dart';
import 'widgets/record_history.dart';

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
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Detail Sapi',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.pink,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showCupertinoModalPopup(
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                    color: Colors.transparent,
                    height: Get.height * 0.4,
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: const Card(
                              child: ListTile(
                                leading: Icon(Icons.report),
                                title: const Text('Lapor Hewan Sakit'),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: const Card(
                              child: ListTile(
                                leading: Icon(Icons.report),
                                title: const Text('Lapor Hewan Sembuh'),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: const Card(
                              child: ListTile(
                                leading: Icon(Icons.report),
                                title: const Text('Lapor Hewan Hamil'),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: const Card(
                              child: ListTile(
                                leading: const Icon(Icons.report),
                                title: const Text('Lapor Hewan Terjual'),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: const Card(
                              child: ListTile(
                                leading: Icon(Icons.report),
                                title: const Text('Lapor Hewan Mati'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          child: const Icon(Icons.add),
        ));
  }
}
