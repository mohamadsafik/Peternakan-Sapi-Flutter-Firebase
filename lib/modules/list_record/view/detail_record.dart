import 'package:flutter/material.dart';

class DetailRecordPage extends StatelessWidget {
  const DetailRecordPage({Key? key, this.data}) : super(key: key);

  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['action'].toString()),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Color.fromARGB(255, 202, 151, 40),
              ),
              title: Text(data['action'].toString()),
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Color.fromARGB(255, 202, 151, 40),
              ),
              title: Text(data['date'].toString()),
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Color.fromARGB(255, 202, 151, 40),
              ),
              title: Text(data['doctor'].toString()),
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Color.fromARGB(255, 202, 151, 40),
              ),
              title: Text(data['noted'].toString()),
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Color.fromARGB(255, 202, 151, 40),
              ),
              title: Text(data['person'].toString()),
            ),
          ],
        ),
      ),
    );
  }
}
