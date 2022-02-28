import 'package:flutter/material.dart';
import '../controllers/add_cowController.dart';
import 'package:get/get.dart';

//menggunakan getxview
class AddCowsPage extends GetView<AddCowController> {
  const AddCowsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('add sapi')),
      ),
      body: SingleChildScrollView(
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
                onPressed: () => controller.addCow(
                  controller.name.text,
                  controller.eartag.text,
                  controller.code.text,
                  controller.gender.text,
                  controller.breed.text,
                  controller.birthdate.text,
                  controller.joinedwhen.text,
                  controller.note.text,
                ),
                child: const Text("Tambah Sapi"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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