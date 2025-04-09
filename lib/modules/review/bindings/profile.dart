import 'package:get/get.dart';
import 'package:yelp/modules/review/controllers/profile.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}