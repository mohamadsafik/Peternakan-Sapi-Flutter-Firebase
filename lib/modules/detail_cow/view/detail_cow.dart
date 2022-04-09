import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../constants/color.dart';
import '../../weight_prediction.dart';
import '../controller/detail_cow_controller.dart';
import '../widgets/cow_information.dart';
import '../widgets/record_history.dart';
import 'widgets/image_show.dart';

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
                top: 0.0,
                bottom: 15.0,
                left: 15.0,
                right: 15.0,
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
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Detail Sapi',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.to(WeightPredictionPage(data: data)),
                        child: Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: green,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 86, 211, 138),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.bedroom_baby,
                            color: Colors.white,
                          ),
                        ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
