import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/modules/social_media/social_media_controller.dart';

import '../../constants/firebase_constants.dart';

class CommentPage extends GetView<SocialMediaController> {
  CommentPage(this.docStatus, {Key? key}) : super(key: key);

  var data = Get.arguments;
  final docStatus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: green,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('post')
              // .where('name', isEqualTo: data['name'])
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: streamSnapshot.data?.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  if (streamSnapshot.data?.docs[index] != null) {
                    final map = streamSnapshot.data?.docs[index];
                    final records = map?["comments"] as List<dynamic>;
                    records.sort((a, b) => b["time"].compareTo(a["time"]));
                    return SingleChildScrollView(
                      child: Column(
                          children: records.map((record) {
                        return Card(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(record['username']),
                                subtitle: Text(record['comment']),
                              ),
                              //   Container(
                              //       margin: EdgeInsets.only(left: 10, right: 10),
                              //       child: Text(record['comment']))
                            ],
                          ),
                        );
                      }).toList(growable: false)),
                    );
                  }
                  return const Text('data');
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        persistentFooterButtons: [
          Center(
              child: SizedBox(
            height: 50,
            width: 240,
            child: TextField(
              controller: controller.comment,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                onPressed: () {
                  controller.addcomment(
                    controller.comment.text,
                    controller.username.text = data['username'].toString(),
                    docStatus.id,
                  );
                },
                icon: Icon(
                  Icons.send,
                ),
              )),
            ),
          ))
        ]);
  }
}
