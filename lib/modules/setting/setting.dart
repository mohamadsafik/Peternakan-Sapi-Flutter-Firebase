import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/controllers/setting_controller.dart';
import 'package:peternakan_sapi/modules/setting/update_profile.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../controllers/auth_controller.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: green,
          actions: [
            IconButton(
                onPressed: () {
                  AuthController.authInstance.signOut();
                },
                icon: Icon(Icons.abc))
          ],
        ),
      ),
      backgroundColor: background,
      body: StreamBuilder(
        stream: controller.stream,
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.active &&
              streamSnapshot.hasData &&
              streamSnapshot.data != null) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Column(children: [
                  const Divider(height: 20),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 223, 219, 219),
                      child: Icon(Icons.person),
                    ),
                    title: Text(
                      documentSnapshot['username'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          Get.toNamed(RouteName.updateprofile,
                              arguments: documentSnapshot);
                        },
                        icon: const Icon(Icons.edit)),
                  ),
                  const Divider(height: 10),
                  Column(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 400,
                        child: Stack(
                          children: [
                            Positioned(left: 20, child: Text('Nomor HP')),
                            Positioned(left: 200, child: Text('08284302727')),
                          ],
                        ),
                      ),
                      Divider(height: 10),
                      SizedBox(
                        height: 40,
                        width: 400,
                        child: Stack(
                          children: [
                            Positioned(left: 20, child: Text('Kata Sandi')),
                            Positioned(left: 200, child: Text('******')),
                          ],
                        ),
                      ),
                      Divider(height: 10),
                      SizedBox(
                        height: 40,
                        width: 400,
                        child: Stack(children: [
                          Positioned(left: 20, child: Text('E-mail')),
                          Positioned(
                            left: 200,
                            child: Text(documentSnapshot['email']),
                          )
                        ]),
                      ),
                    ],
                  ),
                  Divider(height: 10),
                  IconButton(
                      onPressed: () {
                        AuthController.authInstance.signOut();
                      },
                      icon: Icon(
                        Icons.logout,
                        color: Colors.red,
                      )),
                  Divider(height: 10)
                ]);
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
