import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

class AlertComponents extends StatelessWidget {
  const AlertComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(Icons.attach_money),
          ),
          Padding(
            padding: EdgeInsets.all(2.0),
            child: MaterialButton(
              onPressed: () {
                Get.toNamed(RouteName.addmoney);
              },
              child: Text("Income"),
            ),
          )
        ],
      ),
    ]);
  }
}
