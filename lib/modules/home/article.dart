import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';

class ArticlePage extends StatelessWidget {
  ArticlePage({Key? key, this.data}) : super(key: key);
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
                  child: SvgPicture.asset(
                    'assets/listcow/default.svg',
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
