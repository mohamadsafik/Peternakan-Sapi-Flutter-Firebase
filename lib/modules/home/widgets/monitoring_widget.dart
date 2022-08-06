import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constant.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../../controllers/list_cow_controller.dart';

// ignore: camel_case_types
class monitoring_widget extends StatelessWidget {
  monitoring_widget({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<ListCowController>();
  final homecontroller = Get.find<HomeController>();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return StreamBuilder(
        stream: controller.stream,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width / 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Monitoring',
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.arrow_forward))
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width / 40),
                    height: 90,
                    width: width / 2.162162162,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 147, 177, 202)
                            .withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: ListTile(
                        leading: SizedBox(
                          height: 70.0,
                          width: 60.0, // fixed width and height
                          child: Image(
                              image: AssetImage('assets/home/milk-bottle.png')),
                        ),
                        title: Text('13'),
                        subtitle: Text(
                          'Jantan',
                          style: TextStyle(
                            color: Color.fromARGB(255, 22, 90, 155),
                            fontFamily: 'poppins',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 40,
                  ),
                  Container(
                      height: 90,
                      width: width / 2.162162162,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 250, 80, 68)
                              .withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10)),
                      child: const ListTile(
                        leading: const Icon(
                          Icons.person,
                          size: 60,
                        ),
                        title: const Text('1'),
                        subtitle: Text('Betina'),
                      ))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width / 40),
                    height: 90,
                    width: width / 2.162162162,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 59, 209, 116)
                            .withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: ListTile(
                        leading: SizedBox(
                          height: 70.0,
                          width: 60.0, // fixed width and height
                          child:
                              Image(image: AssetImage('assets/home/cow4.png')),
                        ),
                        title: Text('13'),
                        subtitle: Text(
                          'Hamil',
                          style: TextStyle(
                            color: Color.fromARGB(255, 29, 121, 57),
                            fontFamily: 'poppins',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 40,
                  ),
                  Container(
                    height: 90,
                    width: width / 2.162162162,
                    decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: ListTile(
                        leading: SizedBox(
                          height: 70.0,
                          width: 60.0, // fixed width and height
                          child: Image(
                              image: AssetImage('assets/home/thermometer.png')),
                        ),
                        title: Text(
                          '13',
                        ),
                        subtitle: Text(
                          'Sakit',
                          style: TextStyle(
                            color: Color.fromARGB(255, 218, 105, 0),
                            fontFamily: 'poppins',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
