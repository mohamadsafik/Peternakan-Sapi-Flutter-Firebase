import 'package:get/get.dart';
import 'package:peternakan_sapi/modules/belum_selesai/social_media/controller/social_media_controller.dart';

class SocialMediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SocialMediaController());
  }
}
