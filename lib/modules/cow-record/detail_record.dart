import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';

class DetailRecordPage extends StatelessWidget {
  DetailRecordPage({Key? key, this.data}) : super(key: key);
  // var data = Get.arguments;
  final data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['action'].toString()),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.info,
                color: const Color.fromARGB(255, 202, 151, 40),
              ),
              title: Text(data['action'].toString()),
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: const Color.fromARGB(255, 202, 151, 40),
              ),
              title: Text(data['date'].toString()),
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: const Color.fromARGB(255, 202, 151, 40),
              ),
              title: Text(data['doctor'].toString()),
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: const Color.fromARGB(255, 202, 151, 40),
              ),
              title: Text(data['noted'].toString()),
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: const Color.fromARGB(255, 202, 151, 40),
              ),
              title: Text(data['person'].toString()),
            ),
          ],
        ),
      ),
    );
  }
}
