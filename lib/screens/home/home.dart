import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'widgets/cow_container_widget.dart';
import 'widgets/drawer.dart';
import 'widgets/monitoring_widget.dart';
import 'widgets/top_container_widget.dart';
// import 'package:hexcolor/hexcolor.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // final String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const drawer(),
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Top_Container_Widget(),
            const SizedBox(height: 5),
            const CowContainer(),
            const SizedBox(height: 5),
            const monitoring_widget(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 200.0,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 380.0,
                    color: Colors.red,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 380.0,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 380.0,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
