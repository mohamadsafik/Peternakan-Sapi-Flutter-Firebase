import 'package:flutter/material.dart';
import 'package:peternakan_sapi/constants/color.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key, this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edukasi"),
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
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data['date']),
            ),
            ListTile(
              title: Text(
                'Deskripsi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
