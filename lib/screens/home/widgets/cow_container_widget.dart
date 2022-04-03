import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/screens/labor.dart';

class CowContainer extends StatelessWidget {
  const CowContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Text(
                'Cows',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Container(
          width: 375,
          height: 85,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              const Positioned(
                  left: 5,
                  child: SizedBox(
                      height: 85,
                      child: Image(image: AssetImage('assets/home/cow1.png')))),
              Positioned(
                top: 20,
                left: 125,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'sapi',
                    ),
                    Text(
                      '15',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                      size: 35,
                    )),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 375,
          height: 85,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              const Positioned(
                  left: 5,
                  child: SizedBox(
                      height: 85,
                      child:
                          Image(image: AssetImage('assets/home/labor.png')))),
              Positioned(
                top: 20,
                left: 125,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'tenaga kerja',
                    ),
                    Text(
                      '15',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: IconButton(
                    onPressed: () {
                      Get.to(const LaborPage());
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                      size: 35,
                    )),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 375,
          height: 85,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              const Positioned(
                  left: 5,
                  child: SizedBox(
                      height: 85,
                      child: Image(image: AssetImage('assets/home/cow3.png')))),
              Positioned(
                top: 20,
                left: 125,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'tores',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '15',
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                      size: 35,
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
