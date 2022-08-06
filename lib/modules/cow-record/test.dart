import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MyWidget extends StatelessWidget {
  MyWidget({Key? key, required data}) : super(key: key);
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['record'].toString()),
      ),
      body: Container(child: Text(data['record'].toString())),
    );
  }
}
