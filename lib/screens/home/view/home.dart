import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../auth/controller/authController.dart';

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
      appBar: AppBar(
        title: const Text("Welcome!"),
        actions: [
          IconButton(
              onPressed: () {
                // this icon button for signout
                AuthController.authInstance.signOut();
              },
              icon: const Icon(Icons.power_off))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 140,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                ),
                child: Container(
                  height: 30,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                  child: Column(
                    children: [
                      const Center(
                          child: Text('Hitung Bobot',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ))),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: SizedBox(
                            height: 100,
                            child: Image.network(
                                'https://images.unsplash.com/photo-1580570598977-4b2412d01bbc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=867&q=80',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => startBarcodeScanStream(),
              child: Container(
                height: 140,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                ),
                child: Container(
                  height: 30,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                  child: Column(
                    children: [
                      const Center(
                          child: Text('Scan Sapi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ))),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: SizedBox(
                            height: 100,
                            child: Image.network(
                                'https://media.istockphoto.com/vectors/calf-head-with-bar-code-earmark-vector-id118367587?k=20&m=118367587&s=612x612&w=0&h=7Tr5cwcQRbcqT91qnyX26Dc6b2R90x1iBWOOsAGVfq8=',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
