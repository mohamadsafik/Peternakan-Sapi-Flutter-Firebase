import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/constant.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

class CowContainer extends StatelessWidget {
  const CowContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width / 40),
          child: const Text('Cows'),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: width,
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
        Container(
          margin: const EdgeInsets.all(10),
          width: width,
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
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: IconButton(
                    onPressed: () {
                      Get.toNamed(RouteName.employee);
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
        // Container(
        //   margin: const EdgeInsets.all(10),
        //   width: width,
        //   height: 85,
        //   decoration: BoxDecoration(
        //       border: Border.all(color: Colors.grey),
        //       borderRadius: BorderRadius.circular(8)),
        //   child: Stack(
        //     children: [
        //       const Positioned(
        //           left: 5,
        //           child: SizedBox(
        //               height: 85,
        //               child: Image(image: AssetImage('assets/home/cow3.png')))),
        //       Positioned(
        //         top: 20,
        //         left: 125,
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: const [
        //             Text(
        //               'tores',
        //             ),
        //             Text(
        //               '15',
        //             ),
        //           ],
        //         ),
        //       ),
        //       Positioned(
        //         right: 20,
        //         top: 20,
        //         child: IconButton(
        //             onPressed: () {},
        //             icon: const Icon(
        //               Icons.arrow_forward,
        //               color: Colors.grey,
        //               size: 35,
        //             )),
        //       )
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
