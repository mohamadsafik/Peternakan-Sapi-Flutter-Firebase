import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../constants/firebase_constants.dart';
import '../../controllers/auth_controller.dart';

class HomeEmployeePage extends StatefulWidget {
  HomeEmployeePage({Key? key, required data}) : super(key: key);

  @override
  State<HomeEmployeePage> createState() => _HomeEmployeePageState();
}

var data = Get.arguments;

class _HomeEmployeePageState extends State<HomeEmployeePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
          backgroundColor: green,
          title: Text('employee'),
          leading: IconButton(
              onPressed: () {
                AuthController.authInstance.signOut();
              },
              icon: const Icon(Icons.logout))),
      body: Column(
        children: [
          Card(
            child: SizedBox(
              height: 80,
              child: Center(
                child: ListTile(
                    leading: const Image(
                      image: AssetImage('assets/home/cow1.png'),
                    ),
                    title: const Text('Sapi'),
                    subtitle: const Text('2'),
                    trailing: IconButton(
                        onPressed: () {
                          Get.toNamed(RouteName.listcowemployee);
                        },
                        icon: const Icon(Icons.arrow_forward))),
              ),
            ),
          ),
          StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Card(
                  child: SizedBox(
                    height: 80,
                    child: Center(
                        child: Text(
                      DateFormat('dd/MM/yyyy hh:mm:ss').format(DateTime.now()),
                      style: TextStyle(fontSize: 30),
                    )),
                  ),
                );
              }),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: width / 30),
                child: const Text(
                  'Monitoring',
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
                    child: Center(
                      child: ListTile(
                        leading: const SizedBox(
                            height: 70.0,
                            width: 60.0, // fixed width and height
                            child: Icon(
                              Icons.male,
                              size: 50,
                              color: Color.fromARGB(255, 17, 107, 180),
                            )
                            // Image(
                            //     image: AssetImage('assets/home/milk-bottle.png')),
                            ),
                        title: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('cows')
                                .where('uid', isEqualTo: data['uidowner'])
                                .where('gender', isEqualTo: "Jantan")
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                              if (streamSnapshot.hasData &&
                                  streamSnapshot.data != null) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      // final DocumentSnapshot documentSnapshot =
                                      //     streamSnapshot.data!.docs[index];
                                      final int sumJantan =
                                          streamSnapshot.data!.docs.length;
                                      return Text((streamSnapshot.hasData)
                                          ? sumJantan.toString()
                                          : '0');
                                    });
                              }
                              return const CircularProgressIndicator();
                            }),
                        subtitle: const Text(
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
                      child: ListTile(
                        leading: const Icon(
                          Icons.female,
                          size: 60,
                          color: Color.fromARGB(255, 197, 86, 78),
                        ),
                        title: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('cows')
                                .where('uid', isEqualTo: data['uidowner'])
                                .where('gender', isEqualTo: "Betina")
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                              if (streamSnapshot.hasData &&
                                  streamSnapshot.data != null) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      // final DocumentSnapshot documentSnapshot =
                                      //     streamSnapshot.data!.docs[index];
                                      final int sumBetina =
                                          streamSnapshot.data!.docs.length;
                                      return Text((streamSnapshot.hasData)
                                          ? sumBetina.toString()
                                          : '0');
                                    });
                              }
                              return const CircularProgressIndicator();
                            }),
                        subtitle: const Text('Betina'),
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
                    child: Center(
                      child: ListTile(
                        leading: SizedBox(
                          height: 70.0,
                          width: 60.0, // fixed width and height
                          child:
                              Image(image: AssetImage('assets/home/cow4.png')),
                        ),
                        title: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('cows')
                                .where('uid', isEqualTo: data['uidowner'])
                                .where('statuspregnant', isEqualTo: "Hamil")
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                              if (streamSnapshot.hasData &&
                                  streamSnapshot.data != null) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      // final DocumentSnapshot documentSnapshot =
                                      //     streamSnapshot.data!.docs[index];
                                      final int sumPregnant =
                                          streamSnapshot.data!.docs.length;
                                      return Text((streamSnapshot.hasData)
                                          ? sumPregnant.toString()
                                          : '0');
                                    });
                              }
                              return CircularProgressIndicator();
                            }),
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
                    child: Center(
                      child: ListTile(
                        leading: SizedBox(
                          height: 70.0,
                          width: 60.0, // fixed width and height
                          child: Image(
                              image: AssetImage('assets/home/thermometer.png')),
                        ),
                        title: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('cows')
                                .where('uid', isEqualTo: data['uidowner'])
                                .where('statussick', isEqualTo: "Sakit")
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                              if (streamSnapshot.hasData &&
                                  streamSnapshot.data != null) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      // final DocumentSnapshot documentSnapshot =
                                      //     streamSnapshot.data!.docs[index];
                                      final int sumSick =
                                          streamSnapshot.data!.docs.length;
                                      return Text((streamSnapshot.hasData)
                                          ? sumSick.toString()
                                          : '0');
                                    });
                              }
                              return CircularProgressIndicator();
                            }),
                        subtitle: StreamBuilder<Object>(
                            stream: null,
                            builder: (context, snapshot) {
                              return Text(
                                'Sakit',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 218, 105, 0),
                                  fontFamily: 'poppins',
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
