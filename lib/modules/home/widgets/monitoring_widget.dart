import 'package:flutter/material.dart';

// ignore: camel_case_types
class monitoring_widget extends StatelessWidget {
  const monitoring_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'Monitoring',
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
                      'Menyusui',
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
                      'Hamil',
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
              ),
              const SizedBox(width: 10),
              Container(
                height: 90,
                width: 181,
                decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 250, 80, 68).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
