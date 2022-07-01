import 'package:flutter/material.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      appBar: AppBar(),
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
