import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/update_cow_controller.dart';

// ignore: must_be_immutable
class UpdateCowsPage extends StatelessWidget {
  UpdateCowsPage({Key? key, data}) : super(key: key);
  final controller = Get.find<UpdateCowController>();
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Edit Sapi')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextField(
                controller: controller.name..text = data['name'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nama",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.eartag..text = data['eartag'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Ear Tag",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.rasCow..text = data['rasCow'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Kode Ear Tag",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.gender..text = data['gender'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Jenis Kelamin",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.breed..text = data['breed'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Keturunan Dari",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.birthdate..text = data['birthdate'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Tanggal Lahir",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.joinedwhen..text = data['joinedwhen'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Bergabung Pada Tanggal",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.note..text = data['note'],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Catatan Tambahan",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => controller.editCow(
                    controller.name.text,
                    controller.eartag.text,
                    controller.rasCow.text,
                    controller.gender.text,
                    controller.breed.text,
                    controller.birthdate.text,
                    controller.joinedwhen.text,
                    controller.note.text,
                    data.id),
                child: const Text("Tambah Sapi"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
