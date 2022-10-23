import 'package:flutter/material.dart';
import 'package:peternakan_sapi/modules/money_manager/view/money_manager.dart';

import '../../../component/alert_component.dart';

class Income extends StatefulWidget {
  const Income({Key? key}) : super(key: key);

  @override
  _IncomeState createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Income"),
        backgroundColor: Colors.deepOrange,
        centerTitle: false,
        elevation: 0.5,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MoneyManagerPage()));
              }),
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                //this will call the alert
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("add"),
                          content: Container(
                              height: 160.0, child: const AlertComponents()),
                        ));
              }),
        ],
      ),

      //  navigation bar
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            const Expanded(
              child: ListTile(
                title: Text("Balance:"),
                subtitle: Text("\$720"),
              ),
            ),
            const Expanded(
              child: ListTile(
                title: Text("Expense:"),
                subtitle: Text(
                  "\$230",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.deepOrange,
                    ))),
          ],
        ),
      ),
    );
  }
}
