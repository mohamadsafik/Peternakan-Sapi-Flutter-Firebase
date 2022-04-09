import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/modules/labor/view/add_labor.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

class LaborPage extends StatelessWidget {
  const LaborPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(RouteName.addlabor);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'absensi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  height: 90,
                  width: 181,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 147, 177, 202)
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: ListTile(
                      leading: SizedBox(
                        height: 70.0,
                        width: 60.0, // fixed width and height
                        child: Image(
                            image: AssetImage('assets/home/milk-bottle.png')),
                      ),
                      title: Text(
                        '13',
                        style: TextStyle(
                            color: Color.fromARGB(255, 22, 90, 155),
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'hadir',
                        style: TextStyle(
                          color: Color.fromARGB(255, 22, 90, 155),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 90,
                  width: 181,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 59, 209, 116)
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: ListTile(
                      leading: SizedBox(
                        height: 70.0,
                        width: 60.0, // fixed width and height
                        child: Image(image: AssetImage('assets/home/cow4.png')),
                      ),
                      title: Text(
                        '13',
                        style: TextStyle(
                            color: Color.fromARGB(255, 29, 121, 57),
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'tidak hadir',
                        style: TextStyle(
                          color: Color.fromARGB(255, 29, 121, 57),
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
                  height: 90,
                  width: 181,
                  decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: ListTile(
                      leading: SizedBox(
                        height: 70.0,
                        width: 60.0, // fixed width and height
                        child: Image(
                            image: AssetImage('assets/home/milk-bottle.png')),
                      ),
                      title: Text(
                        '13',
                        style: TextStyle(
                            color: Color.fromARGB(255, 22, 90, 155),
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'sakit & ijin',
                        style: TextStyle(
                          color: Color.fromARGB(255, 22, 90, 155),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 90,
                  width: 181,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 250, 80, 68)
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: ListTile(
                      leading: SizedBox(
                        height: 70.0,
                        width: 60.0, // fixed width and height
                        child: Image(image: AssetImage('assets/home/cow4.png')),
                      ),
                      title: Text(
                        '13',
                        style: TextStyle(
                            color: Color.fromARGB(255, 29, 121, 57),
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'cuti',
                        style: TextStyle(
                          color: Color.fromARGB(255, 29, 121, 57),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
