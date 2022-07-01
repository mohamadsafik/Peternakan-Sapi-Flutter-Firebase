import 'package:flutter/material.dart';

import '../../../constants/color.dart';

class CowInformation extends StatelessWidget {
  const CowInformation({Key? key, this.data}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: background,
                      ),
                      child: null),
                  Container(
                      height: 30,
                      width: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text('data sapi',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      )),
                  Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: background,
                      ),
                      child: Center(
                        child: GestureDetector(
                          // onTap: () => Get.to(AddTaskPage(
                          //   docID: data.id,
                          //   data: data,
                          // )),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                      ))
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text('name :'), Text(data['name'])],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('eartag :'),
                  Text(
                    data['eartag'].toString(),
                    maxLines: 1,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 8,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text('gender :'), Text(data['gender'])],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text('breed :'), Text(data['breed'])],
              ),
              const Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Tanggal lahir :'),
                Text(data['birthdate'])
              ]),
              const Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('tanggal masuk :'),
                Text(data['joinedwhen'])
              ]),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text('catatan :'), Text(data['note'])],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text('berat :'), Text(data['note'])],
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
