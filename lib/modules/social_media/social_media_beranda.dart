import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/social_media/social_media_controller.dart';

import '../../constants/color.dart';

class SocialMediaPage extends GetView<SocialMediaController> {
  SocialMediaPage({Key? key}) : super(key: key);
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            leading: Text(data['username']),
            title: Center(
              child: GestureDetector(
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext bc) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text('buat status'),
                            actions: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.post_add),
                              )
                            ],
                          ),
                          body: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.getImage();
                                      },
                                      child: GetBuilder<SocialMediaController>(
                                        builder: (c) => controller
                                                    .pickedImage !=
                                                null
                                            ? Column(
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: FileImage(
                                                              File(controller
                                                                  .pickedImage!
                                                                  .path),
                                                            ),
                                                            fit: BoxFit.cover)),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      controller.cancelImage();
                                                    },
                                                    child: const Text('Hapus'),
                                                  ),
                                                ],
                                              )
                                            : Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                width: 100,
                                                height: 100,
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  color: Colors.grey[800],
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: controller.status,
                                    minLines:
                                        12, // any number you need (It works as the rows for the textarea)
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: const InputDecoration(
                                        hintText: "apa yang kamu pikirkan?"),
                                  )
                                ],
                              ),
                            ),
                          ),
                          persistentFooterButtons: [
                            Center(
                                child: SizedBox(
                                    height: 50,
                                    width: 240,
                                    child: ElevatedButton(
                                        onPressed: () => controller.addStatus(
                                              controller.status.text,
                                            ),
                                        child: const Text('simpan sapi'))))
                          ],
                        );
                      });
                },
                child: Container(
                    height: 50,
                    width: 150,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: const Text('apa yang terjadi di peternakanmu')),
              ),
            ),
            backgroundColor: green,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt))
            ],
          )),
      backgroundColor: background,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('post')
            // .where('uid', isEqualTo: currentUser)
            .snapshots(),
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
                return Card(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 400,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Center(
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(documentSnapshot['grup']),
                            subtitle: Text(documentSnapshot['username']),
                            trailing: Text(documentSnapshot['date']),
                          ),
                        ),
                      ),
                      Container(
                        width: 400,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 8, 8),
                          child: Text(documentSnapshot['status'].toString()),
                        ),
                      ),
                      documentSnapshot['image'] != null
                          ? Container(
                              height: 200,
                              width: 400,
                              decoration:
                                  const BoxDecoration(color: Colors.blue),
                              child: Image.network(
                                documentSnapshot['image'],
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(),
                      const Divider(
                        height: 2,
                        color: Colors.white,
                      ),
                      Container(
                        height: 40,
                        width: 400,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 10,
                                left: 30,
                                child: Obx(
                                    () => Text(controller.like.toString()))),
                            const Positioned(
                                top: 10, right: 30, child: Text('9 comment')),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 8,
                        color: Colors.white,
                      ),
                      Container(
                        height: 40,
                        width: 400,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: controller.click == true
                                    ? Colors.pink
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                controller.likeUnlike();
                              },
                            ),
                            const Icon(
                              Icons.chat_bubble_outline,
                            ),
                            const Icon(Icons.share_outlined)
                          ],
                        ),
                      ),
                    ],
                  ),
                );
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
