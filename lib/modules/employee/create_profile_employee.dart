import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/controllers/create_profile_employee_controller.dart';
import 'package:peternakan_sapi/modules/employee/home_employee.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../constants/color.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/setting_controller.dart';

class CreateProfileEmployee extends StatefulWidget {
  CreateProfileEmployee({Key? key}) : super(key: key);

  @override
  State<CreateProfileEmployee> createState() => _CreateProfileEmployeeState();
}

class _CreateProfileEmployeeState extends State<CreateProfileEmployee> {
  final controller = Get.find<CreateProfileEmployeeController>();

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
                icon: const Icon(Icons.abc))
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
                    leading: const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 223, 219, 219),
                      child: Icon(Icons.person),
                    ),
                    title: Text(
                      documentSnapshot['username'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext bc) {
                                return Scaffold(
                                  body: Center(
                                    child: Container(
                                      height: 400,
                                      width: 400,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 10),
                                          TextField(
                                            controller: controller.username
                                              ..text =
                                                  documentSnapshot['username'],
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: "Nama",
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          TextField(
                                            controller: controller.gender,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: "Gender",
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          TextField(
                                            controller: controller.alamat,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: "Alamat",
                                            ),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                controller.updateProfile(
                                                    controller.username.text,
                                                    controller.alamat.text,
                                                    controller.gender.text,
                                                    documentSnapshot.id);
                                                Get.offAll(HomeEmployeePage());
                                              },
                                              child: const Text('update'))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                          // Get.toNamed(RouteName.updateprofile,
                          //     arguments: documentSnapshot);
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
                            const Positioned(
                                left: 20, child: const Text('Nomor HP')),
                            const Positioned(
                                left: 200, child: const Text('08284302727')),
                          ],
                        ),
                      ),
                      const Divider(height: 10),
                      SizedBox(
                        height: 40,
                        width: 400,
                        child: Stack(
                          children: [
                            const Positioned(
                                left: 20, child: const Text('Kata Sandi')),
                            const Positioned(
                                left: 200, child: const Text('******')),
                          ],
                        ),
                      ),
                      const Divider(height: 10),
                      SizedBox(
                        height: 40,
                        width: 400,
                        child: Stack(children: [
                          const Positioned(left: 20, child: Text('E-mail')),
                          Positioned(
                            left: 200,
                            child: Text(documentSnapshot['email']),
                          )
                        ]),
                      ),
                    ],
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
