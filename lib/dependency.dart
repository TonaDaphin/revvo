import 'package:get/get.dart';
import 'package:yelp/modules/home/controllers/appController.dart';
import 'package:yelp/modules/home/controllers/home.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
