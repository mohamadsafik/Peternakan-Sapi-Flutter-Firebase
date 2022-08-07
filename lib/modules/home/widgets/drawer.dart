import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../../constants/firebase_constants.dart';
import '../../../controllers/auth_controller.dart';

// ignore: camel_case_types
class drawer extends StatelessWidget {
  const drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where('uid', isEqualTo: auth.currentUser?.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.connectionState == ConnectionState.active &&
                  streamSnapshot.hasData &&
                  streamSnapshot.data != null) {
                return ListView.builder(
                    // shrinkWrap: true,
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      return Column(
                        // Important: Remove any padding from the ListView.
                        children: [
                          Container(
                            height: 200,
                            width: 400,
                            color: green,
                            child: Center(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 223, 219, 219),
                                  backgroundImage:
                                      (documentSnapshot['image'] == '')
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
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(documentSnapshot['namefarm']),
                              ),
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.catching_pokemon),
                            title: const Text('Peternakan Sapi'),
                            onTap: () {
                              Get.offAllNamed(RouteName.landing);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.catching_pokemon),
                            title: const Text('Komunitas'),
                            onTap: () {
                              // Update the state of the app
                              // ...
                              // Then close the drawer
                              Get.offAllNamed(RouteName.socialmedia,
                                  arguments: documentSnapshot);
                            },
                          ),
                        ],
                      );
                    });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
