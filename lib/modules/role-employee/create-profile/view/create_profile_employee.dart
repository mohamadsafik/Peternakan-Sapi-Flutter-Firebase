import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duration_button/duration_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/role-employee/create-profile/controller/create_profile_employee_controller.dart';
import 'package:peternakan_sapi/modules/role-employee/home/view/home_employee.dart';
import '../../../../constants/color.dart';

class CreateProfileEmployee extends StatefulWidget {
  const CreateProfileEmployee({Key? key}) : super(key: key);

  @override
  State<CreateProfileEmployee> createState() => _CreateProfileEmployeeState();
}

class _CreateProfileEmployeeState extends State<CreateProfileEmployee> {
  final controller = Get.find<CreateProfileEmployeeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: StreamBuilder(
        stream: controller.stream,
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.active &&
              streamSnapshot.hasData &&
              streamSnapshot.data != null) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return ListTile(
                  trailing: IconDurationButton(
                    Icons.edit,
                    size: 0,
                    iconColor: Colors.white,
                    onPressed: () {
                      controller.updateProfile(documentSnapshot.id);
                      Get.offAll(
                          HomeEmployeePage(
                            data: documentSnapshot,
                          ),
                          arguments: documentSnapshot);
                    },
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
