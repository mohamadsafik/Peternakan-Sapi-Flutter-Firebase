import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ImageShow extends StatelessWidget {
  const ImageShow({
    Key? key,
    required this.data,
  }) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: 800,
        width: 400,
        child: Stack(
          children: [
            Center(
                child: data['image'] != null
                    ? SizedBox(
                        width: 400,
                        height: 800,
                        child: Image.network(
                          data['image'],
                        ),
                      )
                    : SizedBox(
                        width: 400,
                        height: 800,
                        child: SvgPicture.asset(
                          'assets/listcow/default.svg',
                        ),
                      )),
            Positioned(
              left: 10,
              top: 10,
              child: IconButton(
                  onPressed: (() => Get.back()),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
