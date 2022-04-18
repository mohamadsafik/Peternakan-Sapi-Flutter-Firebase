import 'package:flutter/material.dart';

import '../../../constants/constant.dart';

// ignore: camel_case_types
class monitoring_widget extends StatelessWidget {
  const monitoring_widget({
    Key? key,
  }) : super(key: key);

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
          child: const Text(
            'Monitoring',
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: width / 40),
              height: 90,
              width: width / 2.162162162,
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 147, 177, 202).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: ListTile(
                  leading: SizedBox(
                    height: 70.0,
                    width: 60.0, // fixed width and height
                    child:
                        Image(image: AssetImage('assets/home/milk-bottle.png')),
                  ),
                  title: Text('13'),
                  subtitle: Text(
                    'Menyusui',
                    style: TextStyle(
                      color: Color.fromARGB(255, 22, 90, 155),
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width / 40,
            ),
            Container(
              height: 90,
              width: width / 2.162162162,
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 59, 209, 116).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: ListTile(
                  leading: SizedBox(
                    height: 70.0,
                    width: 60.0, // fixed width and height
                    child: Image(image: AssetImage('assets/home/cow4.png')),
                  ),
                  title: Text('13'),
                  subtitle: Text(
                    'Hamil',
                    style: TextStyle(
                      color: Color.fromARGB(255, 29, 121, 57),
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: width / 40),
              height: 90,
              width: width / 2.162162162,
              decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              width: width / 40,
            ),
            Container(
              height: 90,
              width: width / 2.162162162,
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 250, 80, 68).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ],
    );
  }
}
