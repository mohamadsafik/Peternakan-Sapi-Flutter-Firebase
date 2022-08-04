import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/controllers/setting_controller.dart';
import 'package:peternakan_sapi/modules/setting/update_profile.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../controllers/auth_controller.dart';
import '../home/widgets/drawer.dart';

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
                icon: const Icon(Icons.settings))
          ],
        ),
      ),
      drawer: drawer(),
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
                      backgroundColor: const Color.fromARGB(255, 223, 219, 219),
                      child: const Icon(Icons.person),
                    ),
                    title: Text(
                      documentSnapshot['username'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(documentSnapshot['email']),
                    trailing: IconButton(
                        onPressed: () {
                          Get.toNamed(RouteName.updateprofile,
                              arguments: documentSnapshot);
                        },
                        icon: const Icon(Icons.edit)),
                  ),
                  const Divider(height: 20),
                  const SizedBox(
                    height: 60,
                    child: ListTile(
                      leading: Icon(Icons.key),
                      title: Text('Ubah Password'),
                      subtitle: Text(
                        "Perbarui Password Untuk Keamanan",
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                    child: ListTile(
                      leading: Icon(Icons.headphones),
                      title: Text('Hubungi Kamu'),
                      subtitle: Text(
                        "Ada Pertanyaan? Hubungi Kami",
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                    child: ListTile(
                      leading: Icon(Icons.book),
                      title: Text('Syarat & Ketentuan'),
                      subtitle: Text(
                        "Perbarui Password Untuk Keamanan",
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                    child: ListTile(
                      leading: Icon(Icons.share),
                      title: Text('Bagikan Aplikasi'),
                      subtitle: Text(
                        "Ajak Peternak Menggunakan Aplikasi",
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                    child: ListTile(
                      leading: Icon(Icons.star),
                      title: Text('Beri Rating'),
                      subtitle: Text(
                        "Bintangmu Sangat Berarti Buat Kami",
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                    child: ListTile(
                      leading: Icon(Icons.book),
                      title: Text('Versi Aplikasi'),
                      subtitle: Text(
                        "1.10",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ListTile(
                      leading: IconButton(
                          onPressed: () {
                            AuthController.authInstance.signOut();
                          },
                          icon: const Icon(Icons.logout)),
                      title: const Text('Keluar'),
                    ),
                  ),
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
