import 'package:get/get.dart';

class LandingPageController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void dispose() {
    super.dispose();
  }
}
