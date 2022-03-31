import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/screens/detailcow/widgets/record_history.dart';
import '../../constants/color.dart';
import '../weigt_prediction/weight_prediction.dart';
import 'widgets/cow_information.dart';

// ignore: must_be_immutable
class DetailSapiPage extends GetView {
  DetailSapiPage({Key? key, this.data}) : super(key: key);

  var currentUser = FirebaseAuth.instance.currentUser!.uid;
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  "https://www.duniasapi.com/media/k2/items/cache/75b44b0e9c2e5d305fa323c6c51d3476_XL.jpg",
                  height: 250.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 30.0,
                  left: 15.0,
                  child: InkWell(
                    onTap: () => Get.back(),
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
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30.0,
                  right: 15.0,
                  child: InkWell(
                    onTap: () => {},
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
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 15.0,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 241, 255, 247),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ],
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
                  cow_information(data: data),
                  const SizedBox(
                    height: 10,
                  ),
                  record_history(data: data, currentUser: currentUser),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
