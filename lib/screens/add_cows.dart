import 'package:flutter/material.dart';
import '../controllers/add_cowController.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//menggunakan getxview
class AddCowsPage extends GetView<AddCowController> {
  AddCowsPage({Key? key}) : super(key: key);

  var items = ['Jantan', 'Betina'].obs;
  var ras = [
    'Sapi Limousin',
    'Sapi Simental',
    'Sapi Brahman',
    'Sapi Brangus',
    'Sapi Ongole',
    'Sapi Belgian Blue',
    'Sapi Madura',
    'Sapi Bali',
    'Sapi Pegon'
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('add sapi')),
        actions: [
          ElevatedButton(
            onPressed: () => controller.addCow(
              controller.name.text,
              controller.eartag.text,
              controller.rasCow.text,
              controller.gender.text,
              controller.breed.text,
              controller.birthdate.text,
              controller.joinedwhen.text,
              controller.note.text,
            ),
            child: const Text("Save"),
          )
        ],
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
                readOnly: true,
                controller: controller.rasCow,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Ras Sapi",
                  suffixIcon: PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      controller.rasCow.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return ras.map<PopupMenuItem<String>>((String value) {
                        return PopupMenuItem(child: Text(value), value: value);
                      }).toList();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                readOnly: true,
                controller: controller.gender,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Jenis Kelamnin",
                  suffixIcon: PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      controller.gender.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return items.map<PopupMenuItem<String>>((String value) {
                        return PopupMenuItem(child: Text(value), value: value);
                      }).toList();
                    },
                  ),
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
              StreamBuilder<Object>(
                  stream: controller.selectedDate.stream,
                  builder: (context, snapshot) {
                    return TextField(
                      readOnly: true,
                      controller: controller.birthdate
                        ..text = DateFormat("dd-MM-yyyy")
                            .format(controller.selectedDate.value)
                            .toString(),
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(),
                        labelText: "Tanggal Lahir",
                      ),
                      onTap: () {
                        controller.chooseDate;
                      },
                    );
                  }),
              const SizedBox(height: 10),
              StreamBuilder<Object>(
                  stream: controller.dateJoin.stream,
                  builder: (context, snapshot) {
                    return TextField(
                      readOnly: true,
                      controller: controller.joinedwhen
                        ..text = DateFormat("dd-MM-yyyy")
                            .format(controller.dateJoin.value)
                            .toString(),
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(),
                        labelText: "Bergabung Pada Tanggal",
                      ),
                      onTap: () {
                        controller.choosejoin;
                      },
                    );
                  }),
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
                  controller.rasCow.text,
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