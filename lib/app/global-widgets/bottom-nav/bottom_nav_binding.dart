import 'package:dinefinder_user/app/global-widgets/bottom-nav/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class BottomNavBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavBarController>(() => BottomNavBarController());
  }
}
