import 'package:get/get.dart';

class SocialMediaController extends GetxController {
  RxInt like = 0.obs;
  bool click = false;
  void getLike() {
    if (click == false) {
      like - 1;
    } else {
      like + 1;
    }
  }

  //like unlike button
  void likeUnlike() {
    click = !click;
    getLike();
  }
}
