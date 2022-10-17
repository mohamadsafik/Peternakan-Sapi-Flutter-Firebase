import 'package:flutter/material.dart';

import '../controller/home_controller.dart';

class IconFeatureButton extends StatelessWidget {
  final String image;
  final String title;
  const IconFeatureButton({
    Key? key,
    required this.controller,
    required this.image,
    required this.title,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        height: 75,
        width: 75,
        child: Column(
          children: [
            SizedBox(height: 50, child: Image(image: AssetImage(image))),
            Text(
              title,
              style: const TextStyle(fontSize: 15),
            )
          ],
        ));
  }
}
