import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/modules/setting_controller.dart';

import 'auth/controller/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          Container(
            height: 80,
            width: 400,
            decoration: const BoxDecoration(
              color: green,
            ),
            child: Stack(
              children: [
                const Positioned(
                  child: Center(
                    child: Text(
                      'Profile',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 20,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
          const Divider(height: 20),
          const ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 223, 219, 219),
                child: Icon(Icons.person),
              ),
              title: Text(
                "Safik",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          const Divider(height: 10),
          SizedBox(
            height: 40,
            width: 400,
            child: Stack(
              children: const [
                Positioned(left: 20, child: Text('Nomor HP')),
                Positioned(left: 200, child: Text('0981280974203')),
              ],
            ),
          ),
          const Divider(height: 10),
          SizedBox(
            height: 40,
            width: 400,
            child: Stack(
              children: const [
                Positioned(left: 20, child: Text('Kata Sandi')),
                Positioned(left: 200, child: Text('******')),
              ],
            ),
          ),
          const Divider(height: 10),
          SizedBox(
            height: 40,
            width: 400,
            child: Stack(
              children: const [
                Positioned(left: 20, child: Text('E-mail')),
                Positioned(left: 200, child: Text('safik14@gmail.com')),
              ],
            ),
          ),
          const Divider(height: 10),
          IconButton(
              onPressed: () {
                AuthController.authInstance.signOut();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              )),
          const Divider(height: 10)
        ],
      ),
    );
  }
}
