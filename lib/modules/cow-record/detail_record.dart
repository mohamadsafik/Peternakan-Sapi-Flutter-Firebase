import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

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
      body: Container(
          child: Column(
        children: [
          Text(data['action'].toString()),
          Text(data['date'].toString()),
          Text(data['doctor'].toString()),
          Text(data['noted'].toString()),
        ],
      )),
    );
  }
}
