import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/controllers/list_cow_controller.dart';
import 'widgets/cow_container_widget.dart';
import 'widgets/drawer.dart';
import 'widgets/monitoring_widget.dart';

// import 'package:hexcolor/hexcolor.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  final controller = Get.find<ListCowController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: green,
            actions: const [],
          )),
      backgroundColor: background,
      drawer: const drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const Top_Container_Widget(),
            const SizedBox(height: 5),
            const CowContainer(),
            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Container(
                  color: Colors.transparent,
                  height: 75,
                  width: 75,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 50,
                        child: Image(
                          image: AssetImage('assets/home/grass.png'),
                        ),
                      ),
                      Text(
                        'Pakan',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  )),
              Container(
                  color: Colors.transparent,
                  height: 75,
                  width: 75,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 50,
                        child: Image(
                          image: AssetImage('assets/home/cowshed.png'),
                        ),
                      ),
                      Text(
                        'Kandang',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  )),
              Container(
                  color: Colors.transparent,
                  height: 75,
                  width: 75,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 50,
                        child: Image(
                          image: AssetImage('assets/home/weight.png'),
                        ),
                      ),
                      Text(
                        'Bobot',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  )),
              Container(
                  color: Colors.transparent,
                  height: 75,
                  width: 75,
                  child: Column(
                    children: [
                      StreamBuilder(
                          stream: controller.stream,
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                            return SizedBox(
                              height: 50,
                              child: GestureDetector(
                                onTap: () {
                                  controller.scanBarcode(
                                      context, streamSnapshot);
                                },
                                child: const Image(
                                  image: AssetImage('assets/home/qr-scan.png'),
                                ),
                              ),
                            );
                          }),
                      Text(
                        'Scan',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  )),
            ]),
            const SizedBox(height: 10),
            const monitoring_widget(),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: width / 40, right: width / 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Edukasi'),
                  Text('Edukasi'),
                ],
              ),
            ),
            SizedBox(
              height: 162.0,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: background,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 200,
                          height: 90,
                          child: SvgPicture.asset(
                            'assets/listcow/default.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            height: 50,
                            width: 200,
                            color: Colors.grey,
                            child: Text('data'))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
