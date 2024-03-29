import 'package:flutter/material.dart';
import 'package:peternakan_sapi/constants/color.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({Key? key, this.data}) : super(key: key);
  final dynamic data;
  // var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edukasi"),
        backgroundColor: green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 400,
                  height: 250,
                  child: Image.asset(
                    "assets/home/sapibirahi.jpeg",
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
            ListTile(
              title: Text(
                data['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data['date']),
            ),
            const ListTile(
              title: Text(
                'Deskripsi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  data['description'],
                  textAlign: TextAlign.justify,
                )),
          ],
        ),
      ),
    );
  }
}
