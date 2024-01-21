import 'package:dinefinder_user/app/users/modules/dineuser/controllers/booking_controller.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/controllers/detailed_menu_controller.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/controllers/my_existing_booking_controller.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/data/repo/booking_repo_impl.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/domain/repos/booking_repo_interface.dart';
import 'package:get/get.dart';

import '../controllers/dineuser_controller.dart';

class DineuserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DineuserController>(() => DineuserController(Get.find()));
    Get.lazyPut<BookingRepositoryInterface>(
        () => BookingRepoImpl(Get.find(), Get.find()));
    Get.lazyPut<DetailedMenuController>(
        () => DetailedMenuController(Get.find()));
    Get.lazyPut<BookingController>(() => BookingController(Get.find()));
    Get.lazyPut<MyCurrentBookingController>(
        () => MyCurrentBookingController(Get.find()));
  }
}
