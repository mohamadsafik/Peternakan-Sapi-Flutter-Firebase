import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/modules/setting/view/setting.dart';
import '../components/bottom_nav_bar.dart';
import '../controller/landing_page_controller.dart';
import '../../list_cow/view/list_cows.dart';
import '../../home/view/home.dart';
import '../../money_manager/view/money_manager.dart';
import '../../social_media/view/social_media_beranda.dart';

class LandingPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  LandingPage({Key? key}) : super(key: key);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 58,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: background,
            unselectedItemColor:
                const Color.fromARGB(255, 141, 139, 139).withOpacity(0.5),
            selectedItemColor: green,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              bottomNavBar(Icons.home, "Beranda"),
              bottomNavBar(Icons.search, "Sapi"),
              bottomNavBar(Icons.monetization_on, "Keuangan"),
              bottomNavBar(Icons.settings, "Pengaturan"),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar:
            buildBottomNavigationMenu(context, landingPageController),
        body: Obx(() => IndexedStack(
              index: landingPageController.tabIndex.value,
              children: [
                Homepage(),
                const ListCows(),
                const MoneyManagerPage(),
                const SettingPage(),
              ],
            )),
      ),
    );
  }
}
