import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/firebase_constants.dart';
import 'package:peternakan_sapi/controllers/money_manager_controller.dart';
import 'package:peternakan_sapi/modules/money_manager/add_money.dart';

import '../../component/alert_component.dart';
import '../../constants/color.dart';
import '../../constants/constant.dart';
import '../../controllers/auth_controller.dart';
import '../../routes/route_name.dart';
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
                      Get.toNamed(RouteName.addmoney);
                    })
              ],
            )),
        drawer: const drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  color: Colors.white,
                  child: Column(
                    children: const [
                      Expanded(
                        child: ListTile(
                          title: Text("Masuk:"),
                          trailing: Text("15.000.000"),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text("Keluar:"),
                          trailing: Text("5.000.000"),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text("Total:"),
                          trailing: Text(
                            "10.000.000",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 500,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('money')
                      .where('uid', isEqualTo: auth.currentUser?.uid)
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.data != null) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                          final int documentsum =
                              streamSnapshot.data!.docs.length;
                          var intTotal = int.parse(documentSnapshot['total']);
                          return (streamSnapshot.hasData)
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 6.0, right: 6),
                                  child: Card(
                                    child: ListTile(
                                      leading: (documentSnapshot['action'] ==
                                              'Pemasukan')
                                          ? const Icon(Icons.attach_money,
                                              color: Colors.green)
                                          : const Icon(Icons.attach_money,
                                              color: Colors.red),
                                      title: Text(
                                        CurrencyFormat.convertToIdr(
                                            intTotal, 0),
                                      ),
                                      subtitle: Text(
                                        documentSnapshot['note'],
                                      ),
                                      trailing: Text(
                                        (documentSnapshot['date']),
                                      ),
                                    ),
                                  ))
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
          ),
        ));
  }
}
