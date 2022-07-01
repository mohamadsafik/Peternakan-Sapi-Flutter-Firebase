import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peternakan_sapi/constants/color.dart';
import 'package:peternakan_sapi/modules/income/income.dart';
import 'package:peternakan_sapi/modules/setting.dart';
import '../../../modules/web_scraper_bib_lembang.dart';
import '../../home/view/home.dart';
import '../../list_cow/view/list_cows.dart';
import '../../social_media/social_media_beranda.dart';
import '../controller/landing_page_controller.dart';

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
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: background,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.search,
                    size: 20.0,
                  ),
                ),
                label: 'Explore',
                backgroundColor: background,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.qr_code_scanner,
                    size: 20.0,
                  ),
                ),
                label: 'Scan',
                backgroundColor: background,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.location_history,
                    size: 20.0,
                  ),
                ),
                label: 'Places',
                backgroundColor: background,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.settings,
                    size: 20.0,
                  ),
                ),
                label: 'Settings',
                backgroundColor: background,
              ),
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
                const Homepage(),
                ListCows(),
                IncomePage(),
                // const WebScraperApp(),
                SocialMediaPage(),
                //
                SettingPage(),
                // const RecipeDetailsScreen(),
              ],
            )),
        // floatingActionButton: FloatingActionButton(
        //   heroTag: null,
        //   onPressed: () => Get.to(const AddCowsPage()),
        //   child: const Icon(Icons.add),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
