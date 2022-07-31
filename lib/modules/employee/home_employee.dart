import 'package:flutter/material.dart';

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
        appBar: AppBar(
            title: Text('employee'),
            leading: IconButton(
                onPressed: () {
                  AuthController.authInstance.signOut();
                },
                icon: Icon(Icons.logout))));
  }
}
