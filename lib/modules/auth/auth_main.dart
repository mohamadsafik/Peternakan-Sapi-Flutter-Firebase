import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../../constants/firebase_constants.dart';

class AuthMainPage extends StatelessWidget {
  const AuthMainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    var uid = auth.currentUser?.uid;
    return (uid != null)
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: background,
            body: SizedBox(
              height: height,
              width: width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: height / 2,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: green,
                      ),
                      child: Image.asset('assets/home/authmain.png'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Column(
                        children: const [
                          Text(
                            'Mulai Kelola',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'arial'),
                          ),
                          Text(
                            'Peternakanmu disini',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'arial'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'kelola peternakan lebih baik dan terstruktur menggunakan aplikasi manajemen dan monitoring peternakan sapi',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'arial'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 60,
                      width: 350,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                                onTap: () => Get.toNamed(
                                      RouteName.login,
                                    ),
                                child: Container(
                                  height: 60,
                                  width: 175,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 204, 201, 201),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomRight: Radius.circular(15))),
                                  child: const Center(child: Text('Masuk')),
                                )),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteName.register);
                                },
                                child: Container(
                                  height: 60,
                                  width: 190,
                                  decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Center(child: Text('Daftar')),
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
