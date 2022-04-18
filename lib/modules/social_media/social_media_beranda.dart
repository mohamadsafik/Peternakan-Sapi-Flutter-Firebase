import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/social_media/social_media_controller.dart';

import '../../constants/color.dart';

class SocialMediaPage extends GetView<SocialMediaController> {
  const SocialMediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            backgroundColor: green,
            actions: [],
          )),
      backgroundColor: background,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('post')
            // .where('uid', isEqualTo: currentUser)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Column(
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
                    Container(
                      height: 200,
                      width: 400,
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: Image.network(
                        "https://www.duniasapi.com/media/k2/items/cache/75b44b0e9c2e5d305fa323c6c51d3476_XL.jpg",
                        fit: BoxFit.cover,
                      ),
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
                              child:
                                  Obx(() => Text(controller.like.toString()))),
                          const Positioned(
                              top: 10, right: 30, child: Text('9 comment')),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
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
                              Icons.favorite_border,
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
