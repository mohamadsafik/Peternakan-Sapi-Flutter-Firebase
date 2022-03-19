import 'package:flutter/material.dart';

class monitoring extends StatelessWidget {
  const monitoring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 100,
                width: 181,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 147, 177, 202)
                        .withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(width: 10),
              Container(
                height: 100,
                width: 181,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 59, 209, 116)
                        .withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                height: 100,
                width: 181,
                decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(width: 10),
              Container(
                height: 100,
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
