import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/color.dart';
import '../../education/education.dart';

class Education extends StatelessWidget {
  const Education({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: 10),
            child: const Align(
                alignment: Alignment.bottomLeft, child: Text('Edukasi'))),
        SizedBox(
          height: 200.0,
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('article').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.data != null) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return (streamSnapshot.hasData)
                        ? GestureDetector(
                            onTap: () {
                              Get.to(EducationPage(data: documentSnapshot));
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              width: 250.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: background,
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 250,
                                    height: 113,
                                    child: Image.asset(
                                      "assets/home/sapibirahi.jpeg",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                      height: 65,
                                      width: 250,
                                      color: const Color.fromARGB(
                                          255, 209, 208, 208),
                                      child: ListTile(
                                        title: Text(documentSnapshot['title']),
                                        subtitle:
                                            Text(documentSnapshot['date']),
                                      ))
                                ],
                              ),
                            ),
                          )
                        : const CircularProgressIndicator();
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}
