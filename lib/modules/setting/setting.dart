import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/controllers/setting_controller.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../constants/firebase_constants.dart';
import '../../controllers/auth_controller.dart';
import '../home/widgets/drawer.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
                  // AuthController.authInstance.signOut();
                },
                icon: const Icon(Icons.settings))
          ],
        ),
      ),
      // drawer: const drawer(),
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .where('uid', isEqualTo: auth.currentUser?.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.connectionState == ConnectionState.active &&
                    streamSnapshot.hasData) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs.first;
                  return Column(children: [
                    const Divider(height: 20),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 223, 219, 219),
                        backgroundImage: (documentSnapshot['image'] == null ||
                                documentSnapshot['image'] == '')
                            ? null
                            : NetworkImage(
                                documentSnapshot['image'],
                                // child: (documentSnapshot['image'] == '')
                                //     ? const Icon(Icons.person)
                                //     : Image.network(
                                //         documentSnapshot['image'],
                                //         fit: BoxFit.cover,
                                //       )),
                              ),
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
                  ]);
                }
                return Container();
              },
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
                title: Text('Hubungi Kami'),
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
          ],
        ),
      ),
    );
  }
}
