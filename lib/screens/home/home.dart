import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/screens/home/widgets/CowContainer.dart';
import '../auth/controller/authController.dart';
import 'widgets/drawer.dart';
import 'widgets/monitoring.dart';
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

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const drawer(),
      backgroundColor: background,
      // appBar: AppBar(
      //   title: const Text("Welcome!"),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           // this icon button for signout
      //           AuthController.authInstance.signOut();
      //         },
      //         icon: const Icon(Icons.power_off))
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 400,
              decoration: const BoxDecoration(
                color: green,
              ),
              child: Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        // Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: Colors.white,
                      )),
                  Positioned(
                    right: 60,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.white,
                        )),
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          size: 30,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text(
                    'Cows',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const cowContainer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                    'Monitoring',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const monitoring(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 200.0,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 380.0,
                    color: Colors.red,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 380.0,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
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
