import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../auth/controller/authController.dart';
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
        backgroundColor: const Color(0xFFEBFEF6),
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
        body: Stack(
          children: [
            Container(
                height: 800,
                width: 400,
                decoration: const BoxDecoration(
                  color: Color(0xFFEBFEF6),
                )),
            Container(
              height: 300,
              width: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
                // color: Color(0xFFEBFEF6),
                color: Color.fromARGB(255, 86, 211, 138),
              ),
            ),
            const Positioned(
              top: 10,
              left: 10,
              child: Icon(
                Icons.grid_view_rounded,
                size: 30,
                color: Color(0xFFEBFEF6),
              ),
            ),
            const Positioned(
              top: 10,
              right: 40,
              child: Icon(
                Icons.settings,
                size: 30,
                color: Color.fromARGB(255, 110, 121, 115),
              ),
            ),
            const Positioned(
              top: 10,
              right: 10,
              child: Icon(
                Icons.notifications,
                size: 30,
                color: Colors.yellow,
              ),
            ),
            Positioned(
              left: 60,
              top: 170,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 110,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(50),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF8DE8AB),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          child: Image.asset(
                        'assets/home/monitoring_cow.png',
                        height: 80,
                      )),
                      const Text(
                        'Monitoring',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 60,
              top: 170,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 110,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(0),
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF8DE8AB),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          child: Image.asset(
                        'assets/home/monitoring_cow.png',
                        height: 80,
                      )),
                      const Text(
                        'Monitoring',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 60,
              top: 290,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 110,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(0),
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF8DE8AB),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          child: Image.asset(
                        'assets/home/monitoring_cow.png',
                        height: 80,
                      )),
                      const Text(
                        'Monitoring',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 60,
              top: 290,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 110,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(60),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(60),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF8DE8AB),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          child: Image.asset(
                        'assets/home/monitoring_cow.png',
                        height: 80,
                      )),
                      const Text(
                        'Monitoring',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                right: 165,
                top: 250,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.qr_code,
                      size: 50,
                    ),
                  ),
                )),
          ],
        ));
  }
}
