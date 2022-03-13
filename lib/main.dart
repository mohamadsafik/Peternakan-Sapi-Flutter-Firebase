import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/firebase_constants.dart';
import 'package:peternakan_sapi/controllers/add_cowController.dart';
import 'package:peternakan_sapi/controllers/edit_cowController.dart';
import 'package:peternakan_sapi/controllers/list_cowController.dart';
import 'package:peternakan_sapi/screens/loading_page.dart';
import 'controllers/authController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await firebaseInitialization.then((value) {
    Get.put(AuthController());
  });
  addcow.then((value) {
    Get.put(AddCowController());
  });
  editcow.then((value) {
    Get.put(EditCowController());
  });
  deleteSapi.then((value) {
    Get.put(ListCowController());
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        // backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
      ),
      home: const LoadingPage(),
      // home: const Center(
      //   child: CircularProgressIndicator(),
      // ),
    );
  }
}













// void main() async {
//   //initial firebase agar dapat menggunakannya
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);
// //mengambil controller  yang ada supaya bisa digunakan
// //
//   final cowController = Get.put(AddCowController());
//   final authController = Get.put(AuthController(), permanent: true);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//         stream: authController.streamAuthStatus,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             print(snapshot.data);

//             return GetMaterialApp(
//               debugShowCheckedModeBanner: false,
//               title: 'Flutter Demo',
//               theme: ThemeData(
//                 primarySwatch: Colors.blue,
//               ),
//               // home: LoginPage(),
//               home: snapshot.data != null ? const LoadingPage() : LoginPage(),
//             );
//           }
//           return const LoadingPage();
//         });
//   }
// }
