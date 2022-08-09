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
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              backgroundColor: green,
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
            )),
        drawer: const drawer(),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              color: Colors.white,
              child: Row(
                children: const [
                  Expanded(
                    child: ListTile(
                      title: Text("Masuk:"),
                      subtitle: Text("720"),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text("Total:"),
                      subtitle: Text("720"),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text("Keluar:"),
                      subtitle: Text(
                        "230",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
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
                    return (streamSnapshot.hasData)
                        ? Padding(
                            padding: const EdgeInsets.only(left: 6.0, right: 6),
                            child: Card(
                              child: ListTile(
                                leading:
                                    (documentSnapshot['action'] == 'Pemasukan')
                                        ? const Icon(Icons.attach_money,
                                            color: Colors.green)
                                        : const Icon(Icons.attach_money,
                                            color: Colors.red),
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
          )
        ]));
  }
}
