import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/money_manager/view/income.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

class AlertComponents extends StatelessWidget {
  const AlertComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      //this is the button to add income
      Row(
        children: <Widget>[
          Padding(
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
      //    the button to add expense
      //   Row(
      //     children: <Widget>[
      //       Padding(
      //         padding: EdgeInsets.all(4.0),
      //         child: Icon(Icons.money_off),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.all(2.0),
      //         child: MaterialButton(
      //           onPressed: () {
      //             // Navigator.push(context, MaterialPageRoute(builder: (context)=> Expense()));
      //           },
      //           child: Text("Expense"),
      //         ),
      //       )
      //     ],
      //   ),
      //   //    this is the button to add category
      //   Row(
      //     children: <Widget>[
      //       Padding(
      //         padding: EdgeInsets.all(4.0),
      //         child: Icon(Icons.dashboard),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.all(2.0),
      //         child: MaterialButton(
      //           onPressed: () {
      //             // Navigator.push(context, MaterialPageRoute(builder: (context)=> Catagory()));
      //           },
      //           child: Text("Category"),
      //         ),
      //       )
      //     ],
      //   ),
      // ],
    ]);
  }
}
