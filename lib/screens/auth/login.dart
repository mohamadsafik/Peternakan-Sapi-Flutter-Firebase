import 'package:flutter/material.dart';
import 'package:peternakan_sapi/screens/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: Get.textTheme.headline3,
              ),
              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Email"),
              ),
              const SizedBox(
                height: 10,
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
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // this is for the register function in auth controller
                      AuthController.authInstance.register(
                        controller.emailController.text.trim(),
                        controller.passwordController.text.trim(),
                      );
                    },
                    child: const Text("Sign Up"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // this is for the login function in auth controller
                      AuthController.authInstance.login(
                        controller.emailController.text.trim(),
                        controller.passwordController.text.trim(),
                      );
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
