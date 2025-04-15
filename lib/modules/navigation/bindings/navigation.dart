import 'package:get/get.dart';
import 'package:yelp/modules/navigation/controllers/navigation.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
  }
}