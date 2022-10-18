import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/firebase_constants.dart';

class Monitoring extends StatelessWidget {
  const Monitoring({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Monitoring',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            children: [
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('cows')
                      .where('uid', isEqualTo: auth.currentUser?.uid)
                      .where('gender', isEqualTo: "Jantan")
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData && streamSnapshot.data != null) {
                      final int sumJantan = streamSnapshot.data!.docs.length;
                      return MonitoringCard(
                        colorBg: const Color.fromARGB(255, 147, 177, 202)
                            .withOpacity(0.3),
                        colorIcon: const Color.fromARGB(255, 17, 107, 180),
                        icon: Icons.male,
                        subtitle: 'Jantan',
                        title: '$sumJantan',
                      );
                    }
                    return const CircularProgressIndicator();
                  }),
              const SizedBox(width: 12),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('cows')
                      .where('uid', isEqualTo: auth.currentUser?.uid)
                      .where('gender', isEqualTo: "Betina")
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData && streamSnapshot.data != null) {
                      final int sumBetina = streamSnapshot.data!.docs.length;
                      return MonitoringCard(
                        colorBg: const Color.fromARGB(255, 250, 80, 68)
                            .withOpacity(0.3),
                        colorIcon: const Color.fromARGB(255, 197, 86, 78),
                        icon: Icons.female,
                        subtitle: 'Betina',
                        title: '$sumBetina',
                      );
                    }
                    return const CircularProgressIndicator();
                  }),
              Container(
                margin: const EdgeInsets.only(top: 12),
                height: 90,
                width: Get.width / 2.162162162,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 59, 209, 116)
                        .withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: ListTile(
                    leading: const SizedBox(
                      height: 70.0,
                      width: 60.0, // fixed width and height
                      child: Image(image: AssetImage('assets/home/cow4.png')),
                    ),
                    title: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('cows')
                            .where('uid', isEqualTo: auth.currentUser?.uid)
                            .where('statuspregnant', isEqualTo: "Hamil")
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                          if (streamSnapshot.hasData &&
                              streamSnapshot.data != null) {
                            final int sumPregnant =
                                streamSnapshot.data!.docs.length;
                            return Text((streamSnapshot.hasData)
                                ? sumPregnant.toString()
                                : '0');
                          }
                          return const CircularProgressIndicator();
                        }),
                    subtitle: const Text(
                      'Hamil',
                      style: TextStyle(
                        color: Color.fromARGB(255, 29, 121, 57),
                        fontFamily: 'poppins',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                margin: const EdgeInsets.only(top: 12),
                height: 90,
                width: Get.width / 2.162162162,
                decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: ListTile(
                      leading: const SizedBox(
                        height: 70.0,
                        width: 60.0, // fixed width and height
                        child: Image(
                            image: AssetImage('assets/home/thermometer.png')),
                      ),
                      title: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('cows')
                              .where('uid', isEqualTo: auth.currentUser?.uid)
                              .where('statussick', isEqualTo: "Sakit")
                              .snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                            if (streamSnapshot.hasData &&
                                streamSnapshot.data != null) {
                              final int sumSick =
                                  streamSnapshot.data!.docs.length;
                              return Text((streamSnapshot.hasData)
                                  ? sumSick.toString()
                                  : '0');
                            }
                            return const CircularProgressIndicator();
                          }),
                      subtitle: const Text(
                        'Sakit',
                        style: TextStyle(
                          color: Color.fromARGB(255, 218, 105, 0),
                          fontFamily: 'poppins',
                        ),
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class MonitoringCard extends StatelessWidget {
  final AssetImage? image;
  final IconData? icon;
  final String title;
  final String subtitle;
  final Color colorIcon;
  final Color colorBg;
  const MonitoringCard({
    Key? key,
    // required this.sumBetina,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.colorIcon,
    required this.colorBg,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        width: Get.width / 2.162162162,
        decoration: BoxDecoration(
            color: colorBg, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(
            icon,
            // Icons.female,
            size: 60,
            color: colorIcon,
          ),
          title: Text(title),
          subtitle: Text(subtitle),
        ));
  }
}
