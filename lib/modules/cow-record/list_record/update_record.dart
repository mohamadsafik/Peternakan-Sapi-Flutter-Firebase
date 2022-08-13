import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class UpdateRecordPage extends StatefulWidget {
  const UpdateRecordPage({Key? key, record}) : super(key: key);

  @override
  State<UpdateRecordPage> createState() => _UpdateRecordPageState();
}

class _UpdateRecordPageState extends State<UpdateRecordPage> {
  var record = Get.arguments;
  late TextEditingController action =
      TextEditingController(text: record['actioon']);
  late TextEditingController status = TextEditingController();
  late TextEditingController date = TextEditingController();
  late TextEditingController diagnosis = TextEditingController();
  late TextEditingController vaksin = TextEditingController();
  late TextEditingController doctor = TextEditingController();
  late TextEditingController note = TextEditingController();
  late TextEditingController straw = TextEditingController();
  late TextEditingController inseminator = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: action,
          ),
          ElevatedButton(
              onPressed: () {
                print(record);
              },
              child: Text('data'))
        ],
      ),
    );
  }
}
