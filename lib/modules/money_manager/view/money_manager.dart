import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/firebase_constants.dart';
import 'package:peternakan_sapi/modules/money_manager/controller/money_manager_controller.dart';
import 'package:peternakan_sapi/modules/money_manager/view/detail_money.dart';
import '../../../constants/color.dart';
import '../../../constants/currency.dart';
import '../../../routes/route_name.dart';

class MoneyManagerPage extends StatefulWidget {
  const MoneyManagerPage({Key? key}) : super(key: key);

  @override
  _MoneyManagerPageState createState() => _MoneyManagerPageState();
}

final controller = Get.find<MoneyManagerController>();

class _MoneyManagerPageState extends State<MoneyManagerPage> {
  var sumTotal;

  @override
  Widget build(BuildContext context) {
    //this code gives us the width of the screen
    final mediaQuerydata = MediaQuery.of(context);
    final size = mediaQuerydata.size.width;

    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: green,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Get.toNamed(RouteName.addmoney);
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Expanded(
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('money')
                              .where('action', isEqualTo: "Pemasukan")
                              .where('uid', isEqualTo: auth.currentUser?.uid)
                              .snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                            if (streamSnapshot.data != null) {
                              int sum = 0;

                              streamSnapshot.data!.docs.forEach((value) {
                                var prices = int.parse(value['total']);

                                sum = sum + prices;
                                print(sum);
                              });
                              return ListTile(
                                title: Text("Masuk:"),
                                trailing:
                                    Text(CurrencyFormat.convertToIdr(sum, 0)),
                              );
                            }

                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('money')
                              .where('action', isEqualTo: "Pengeluaran")
                              .where('uid', isEqualTo: auth.currentUser?.uid)
                              .snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                            if (streamSnapshot.data != null) {
                              int sum = 0;

                              streamSnapshot.data!.docs.forEach((value) {
                                var prices = int.parse(value['total']);

                                sum = sum + prices;
                                print(sum);
                              });
                              return ListTile(
                                title: Text("Keluar:"),
                                trailing:
                                    Text(CurrencyFormat.convertToIdr(sum, 0)),
                              );
                            }

                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('money')
                              .where('uid', isEqualTo: auth.currentUser?.uid)
                              .snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                            if (streamSnapshot.data != null) {
                              int sumIn = 0;
                              int sumOut = 0;

                              streamSnapshot.data!.docs.forEach((value) {
                                var prices = int.parse(value['total']);
                                if (value['action'] == "Pemasukan") {
                                  sumIn = sumIn + prices;
                                }
                                if (value['action'] == "Pengeluaran") {
                                  sumOut = sumOut + prices;
                                }
                              });
                              var total = sumIn - sumOut;
                              return ListTile(
                                title: Text("Total:"),
                                trailing:
                                    Text(CurrencyFormat.convertToIdr(total, 0)),
                              );
                            }

                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('money')
                    .where('uid', isEqualTo: auth.currentUser?.uid)
                    .snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.data != null) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
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
                                padding:
                                    const EdgeInsets.only(left: 6.0, right: 6),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(DetailMoney(data: documentSnapshot));
                                  },
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
            ],
          ),
        ));
  }
}
