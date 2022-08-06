import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/firebase_constants.dart';
import 'package:peternakan_sapi/controllers/money_manager_controller.dart';

import '../../component/alert_component.dart';
import '../../constants/color.dart';
import '../../controllers/auth_controller.dart';
import '../home/widgets/drawer.dart';

class MoneyManagerPage extends StatefulWidget {
  const MoneyManagerPage({Key? key}) : super(key: key);

  @override
  _MoneyManagerPageState createState() => _MoneyManagerPageState();
}

final controller = Get.find<MoneyManagerController>();

class _MoneyManagerPageState extends State<MoneyManagerPage> {
  @override
  Widget build(BuildContext context) {
    //this code gives us the width of the screen
    final mediaQuerydata = MediaQuery.of(context);
    final size = mediaQuerydata.size.width;

    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          title: const Text("Flutter cash app"),
          backgroundColor: green,
          centerTitle: false,
          elevation: 0.5,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  //this will call the alert
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text("add"),
                            content: Container(
                              height: 160.0,
                              child: const AlertComponents(),
                            ),
                          ));
                })
          ],
        ),
        body: Column(children: [
          Container(
            color: Colors.white,
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: ListTile(
                    title: Text("Income:"),
                    subtitle: Text("\$720"),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text("Balance:"),
                    subtitle: Text("\$720"),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text("Expense:"),
                    subtitle: Text(
                      "\$230",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('money')
                // .orderBy('time')
                .where('uid', isEqualTo: auth.currentUser?.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.data != null) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    final int documentsum = streamSnapshot.data!.docs.length;
                    return Card(
                      child: ListTile(
                        leading: (documentSnapshot['action'] == 'Pemasukan')
                            ? const Icon(Icons.attach_money,
                                color: Colors.green)
                            : const Icon(Icons.attach_money, color: Colors.red),
                        title: Text(
                          documentSnapshot['total'],
                        ),
                        subtitle: Text(
                          documentSnapshot['note'],
                        ),
                        trailing: Text(
                            (documentSnapshot['action'] == 'Pemasukan')
                                ? 'masuk'
                                : 'keluar'),
                      ),
                    );
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        ]));
  }
}
