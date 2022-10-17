import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  // final int sumBetina;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        width: Get.width / 2.162162162,
        decoration: BoxDecoration(
            color:
                // const Color.fromARGB(255, 250, 80, 68).withOpacity(0.3),
                colorBg,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(
            icon,
            // Icons.female,
            size: 60,
            color:
                // Color.fromARGB(255, 197, 86, 78),
                colorIcon,
          ),
          title: Text(title
              // (streamSnapshot.hasData) ? sumBetina.toString() : '0'
              ),
          subtitle: Text(subtitle),
        ));
  }
}