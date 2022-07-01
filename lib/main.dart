import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/constants/firebase_constants.dart';
import 'package:peternakan_sapi/modules/auth/view/auth_main.dart';
import 'package:peternakan_sapi/modules/social_media/social_media_controller.dart';
import 'package:peternakan_sapi/routes/app_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'modules/auth/controller/auth_controller.dart';
import 'routes/route_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) {
    Get.put(AuthController());
    Get.put(SocialMediaController());
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
          fontFamily: GoogleFonts.poppins().fontFamily,
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: background,
          textTheme: GoogleFonts.poppinsTextTheme().copyWith(
            bodyText2: const TextStyle(
              color: Color.fromARGB(255, 31, 30, 30),
              fontSize: 16,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(const StadiumBorder())))),
      initialRoute: RouteName.authmain,
      getPages: AppPages.pages,
    );
  }
}
