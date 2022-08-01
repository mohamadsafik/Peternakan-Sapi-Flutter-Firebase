import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/modules/employee/list_cow_employee.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../controllers/auth_controller.dart';

class HomeEmployeePage extends StatefulWidget {
  HomeEmployeePage({Key? key}) : super(key: key);

  @override
  State<HomeEmployeePage> createState() => _HomeEmployeePageState();
}

class _HomeEmployeePageState extends State<HomeEmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
          title: Text('employee'),
          leading: IconButton(
              onPressed: () {
                AuthController.authInstance.signOut();
              },
              icon: Icon(Icons.logout))),
      body: Column(
        children: [
          Card(
            child: SizedBox(
              height: 80,
              child: Center(
                child: ListTile(
                    leading: Image(
                      image: AssetImage('assets/home/cow1.png'),
                    ),
                    title: Text('Cows'),
                    subtitle: Text('2'),
                    trailing: IconButton(
                        onPressed: () {
                          Get.toNamed(RouteName.listcowemployee);
                        },
                        icon: Icon(Icons.arrow_forward))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
