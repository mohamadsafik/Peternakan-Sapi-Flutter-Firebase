import 'package:flutter/material.dart';
import 'controller/add_cow_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

//menggunakan getxview
class AddCowsPage extends StatefulWidget {
  const AddCowsPage({Key? key}) : super(key: key);

  @override
  State<AddCowsPage> createState() => _AddCowsPageState();
}

class _AddCowsPageState extends State<AddCowsPage> {
  final controller = Get.put(AddCowController());

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
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: const Color(0xffFDCF09),
                    child: controller.photo != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              controller.photo!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50)),
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.name..text = '',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nama",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.eartag..text = '',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Ear Tag",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                readOnly: true,
                controller: controller.rasCow..text = '',
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Ras Sapi",
                  suffixIcon: PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      controller.rasCow.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return controller.ras
                          .map<PopupMenuItem<String>>((String value) {
                        return PopupMenuItem(child: Text(value), value: value);
                      }).toList();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                readOnly: true,
                controller: controller.gender..text = '',
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Jenis Kelamnin",
                  suffixIcon: PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      controller.gender.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return controller.items
                          .map<PopupMenuItem<String>>((String value) {
                        return PopupMenuItem(child: Text(value), value: value);
                      }).toList();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.breed..text = '',
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
                        labelText: "Masuk Kandang Tanggal",
                      ),
                      onTap: () {
                        controller.choosejoin;
                      },
                    );
                  }),
              const SizedBox(height: 10),
              TextField(
                controller: controller.note..text = '',
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

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: SizedBox(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Gallery'),
                      onTap: () {
                        controller.imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      controller.imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
