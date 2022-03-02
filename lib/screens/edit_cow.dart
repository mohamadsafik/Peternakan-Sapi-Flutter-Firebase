import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_cowController.dart';

//menggunakan getxview
class EditCowPage extends GetView {
  EditCowPage({Key? key, this.data}) : super(key: key);

  var data = Get.arguments;
  //  final TextEditingController name = TextEditingController(text: data['name'];
  // controller.name.text = data['name'];
  //           controller.eartag.text = data['eartag'];
  //           controller.code.text = data['code'];
  //           controller.gender.text = data['gender'];
  //           controller.breed.text = data['breed'];
  //           controller.birthdate.text = data['birthdate'];
  //           controller.joinedwhen.text = data['joinedwhen'];
  //           controller.note.text = data['note'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Edit sapi')),
        ),
        body:
            // FutureBuilder<DocumentSnapshot<Object?>>(
            // future: controller.getData(Get.arguments),
            // builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.done) {
            // var data = snapshot.data!.data() as Map<String, dynamic>;
            // controller.name.text = data['name'];
            // controller.eartag.text = data['eartag'];
            // controller.code.text = data['code'];
            // controller.gender.text = data['gender'];
            // controller.breed.text = data['breed'];
            // controller.birthdate.text = data['birthdate'];
            // controller.joinedwhen.text = data['joinedwhen'];
            // controller.note.text = data['note'];
            SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextField(
                  controller: controller.name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nama",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: controller.eartag,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Ear Tag",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: controller.code,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Kode Ear Tag",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: controller.gender,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Jenis Kelamin",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: controller.breed,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Keturunan Dari",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: controller.birthdate,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Tanggal Lahir",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: controller.joinedwhen,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Bergabung Pada Tanggal",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: controller.note,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Catatan Tambahan",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  // onPressed: () {},
                  onPressed: () => controller.editCow(
                    controller.name.text,
                    controller.eartag.text,
                    controller.code.text,
                    controller.gender.text,
                    controller.breed.text,
                    controller.birthdate.text,
                    controller.joinedwhen.text,
                    controller.note.text,
                    Get.arguments,
                  ),
                  child: const Text("Edit Sapi"),
                )
              ],
            ),
          ),
        ));
  }
}
          // return const Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }

//menggunakan statefull
// class AddCow extends StatefulWidget {
//   const AddCow({Key? key}) : super(key: key);
//   @override
//   _AddCowState createState() => _AddCowState();
// }
// class _AddCowState extends State<AddCow> {
//   // final TextEditingController name = TextEditingController();
//   // final TextEditingController code = TextEditingController();
//   // final TextEditingController gender = TextEditingController();
// @override
//   Widget build(BuildContext context) {
//     // FirebaseFirestore firestore = FirebaseFirestore.instance;
//     // CollectionReference cows = firestore.collection('cows');