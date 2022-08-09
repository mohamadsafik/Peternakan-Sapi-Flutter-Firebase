import 'package:flutter/material.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/constants/firebase_constants.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/routes/route_name.dart';

import '../../../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser != null) {
      return Container(
        height: 400,
        width: 400,
        decoration: const BoxDecoration(color: green),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "Hallo",
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Silakan Login Menggunakan Akunmu",
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    children: [
                      TextField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: "Email"),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        obscureText: true,
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: "Password"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text('Lupa Password'),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //button login if user null in firebase auth return dialog

                      GestureDetector(
                        onTap: () {
                          AuthController.authInstance.login(
                            controller.emailController.text.trim(),
                            controller.passwordController.text.trim(),
                          );
                        },
                        child: Container(
                          width: 380,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: green,
                          ),
                          child: const Center(child: Text('masuk')),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 1, width: 60, color: Colors.black),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text('masuk dengan cara lain'),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(height: 1, width: 60, color: Colors.black),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 80, 197, 84),
                      ),
                    ),
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: IconButton(
                            onPressed: () {
                              controller.handleSignIn();
                            },
                            icon: const Icon(Icons.facebook))),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(
                        Icons.facebook,
                        color: Color.fromARGB(255, 24, 115, 190),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('tidak punya akun? '),
                    GestureDetector(
                      onTap: () => Get.offNamed(RouteName.register),
                      child: const Text(
                        'daftar sekarang',
                        style:
                            TextStyle(color: Color.fromARGB(255, 21, 107, 179)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
