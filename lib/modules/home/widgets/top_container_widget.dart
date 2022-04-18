import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../auth/controller/auth_controller.dart';

// ignore: camel_case_types
class Top_Container_Widget extends StatelessWidget {
  const Top_Container_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Container(
      height: 100,
      width: width,
      decoration: const BoxDecoration(
        color: green,
      ),
      child: Stack(
        children: [
          IconButton(
              onPressed: () {
                // Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.white,
              )),
          Positioned(
            right: 60,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                )),
          ),
          Positioned(
            right: 10,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  size: 30,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
