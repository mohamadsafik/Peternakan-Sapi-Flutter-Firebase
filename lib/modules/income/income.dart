import 'package:flutter/material.dart';
import 'package:peternakan_sapi/constants/firebase_constants.dart';

import '../../constants/color.dart';
import '../../controllers/auth_controller.dart';
import '../home/widgets/drawer.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: green,
            actions: [
              IconButton(
                  onPressed: () {
                    AuthController.authInstance.signOut();
                  },
                  icon: Icon(Icons.abc))
            ],
          )),
      drawer: drawer(),
      backgroundColor: background,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                color: Colors.blue,
                height: 150,
                width: width / 2,
              ),
              Container(
                color: Colors.red,
                height: 150,
                width: width / 2,
              )
            ],
          )
        ],
      ),
    );
  }
}
