import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/modules/auth/view/register.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../../constants/firebase_constants.dart';

class AuthMainPage extends StatelessWidget {
  const AuthMainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.all(10),
            height: 400,
            width: 400,
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
          const Center(
            child: SizedBox(
              width: 350,
              child: Text(
                'kelola peternakan lebih baik raih dan terstruktur menggunakan aplikasi manajemen peternakan',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'arial'),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            height: 60,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: green,
            ),
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
          )
        ],
      ),
    );
  }
}
