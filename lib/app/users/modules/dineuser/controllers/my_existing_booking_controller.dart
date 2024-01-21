import 'dart:developer';

import 'package:dinefinder_user/app/global-widgets/app_snackbar.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/domain/entities/booking_entity.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/domain/repos/booking_repo_interface.dart';
import 'package:get/get.dart';

class MyCurrentBookingController extends GetxController {
  final BookingRepositoryInterface repository;
  MyCurrentBookingController(this.repository);

  RxBool isLoading = false.obs;

  var bookings = RxList<BookingEntity>([]);

  @override
  void onInit() {
    _loadUserBookings();
    super.onInit();
  }

  deleteBooking(String bookingId, String sellerId) {
    try {
      isLoading.value = true;
      repository.deleteBooking(bookingId, sellerId);
    } catch (err) {
      isLoading.value = false;
      AppSnackBar.showSnackbar(msg: "Error while cancel booking. $err");
    } finally {
      isLoading.value = false;
    }
  }

  void _loadUserBookings() async {
    try {
      isLoading.value = true;
      // Listen to the stream from the repository
      repository.getCurrentUserBookingData().listen((fetchedBookings) {
        bookings.value = fetchedBookings;
      });
    } catch (e) {
      AppSnackBar.showSnackbar(msg: "$e");
      log('Error fetching bookings: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
