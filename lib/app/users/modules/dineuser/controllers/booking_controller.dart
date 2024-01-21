import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/global-widgets/app_elevated_button.dart';
import 'package:dinefinder_user/app/global-widgets/app_snackbar.dart';
import 'package:dinefinder_user/app/users/modules/auth/data/models/user_model/user_model.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/controllers/detailed_menu_controller.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/data/models/booking_model/booking_model.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/domain/repos/booking_repo_interface.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/local-widgets/app_time_picker.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/local-widgets/num_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class BookingController extends GetxController {
  final BookingRepositoryInterface repositoryInterface;
  // final AuthRepositoryInterface authRepositoryInterface;
  final QueryDocumentSnapshot<Object?>? item; //seller detail item
  var isLoading = false.obs;

  BookingController(this.repositoryInterface)
      : item = Get.arguments as QueryDocumentSnapshot<Object?>?;

  final detailedMenuController = Get.find<DetailedMenuController>();
  final authCntrl = Get.find<AuthController>();

  static String formatDate(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }

  var selectednum = 1.obs;
  var selectedseatNum = 1.obs;

  final selectedDate = formatDate(DateTime.now()).obs;

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 60)),
    );

    if (pickedDate != null) {
      selectedDate.value = formatDate(pickedDate);
    }
  }

  Rx<BookingModel?> currentBooking = Rx<BookingModel?>(null);

  Future<void> confirmAndSaveBooking() async {
    try {
      isLoading.value = true;
      final user = UserModel(
        uid: AuthUtils.signUpUserData!.uid!,
        location: AuthUtils.signUpUserData!.location!,
        mobileNumber: AuthUtils.signUpUserData!.mobileNumber!,
        name: AuthUtils.signUpUserData!.name!,
        profUrl: AuthUtils.signUpUserData!.profUrl,
      );

      log(user.profUrl!);

      // final bookingTime =
      //     "${detailedMenuController.hrs} hrs : ${detailedMenuController.min} min";
      final bookingTime = (detailedMenuController.hrs.value == 0 &&
              detailedMenuController.min.value == 0)
          ? "9 hrs 0 min"
          : "${detailedMenuController.hrs} hrs : ${detailedMenuController.min} min";

      final bookingData = BookingModel(
        date: selectedDate.value,
        numberOfSeat: selectedseatNum.value.toString(),
        numberOfTable: selectednum.value.toString(),
        time: bookingTime,
        user: user,
        sellername: item!['name'],
        sellerLoc: item!['location'],
        sellerUid: item!['uid'],
        bookingId: const Uuid().v1(),
        timestamp: Timestamp.now(),
      );

      BookingModel result =
          await repositoryInterface.confirmBooking(bookingData);
      if (result.bookingId != null) {
        currentBooking.value = result;
        Get.back();
        isLoading.value = false;
        AppSnackBar.showSnackbar(msg: "Booking confirmed");
      }
    } catch (error) {
      log("Error confirming booking: $error");
    } finally {
      isLoading.value = false;
    }
  }

  openBookingMenuSheet() {
    return showModalBottomSheet(
        context: Get.context!,
        showDragHandle: true,
        useSafeArea: true,
        backgroundColor: AppColor.monoWhite,
        builder: (_) {
          return Container(
            height: 340.h,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Confirm Booking!",
                      style: Get.textTheme.bodyMedium!
                          .copyWith(color: AppColor.mono),
                    ),
                    const IconButton(
                      onPressed: Nav.pop,
                      icon: Icon(
                        Icons.close,
                        color: AppColor.mono,
                      ),
                    ),
                  ],
                ),
                Divider(height: 1.h, color: AppColor.monoLight),
                SizedBox(height: 10.h),
                NumberSelectorWidget(
                  item: detailedMenuController.menuitem!["tableNumber"],
                  title: "Select Number of tables",
                ),
                SizedBox(height: 10.h),
                SeatSelectorWidget(
                  item: detailedMenuController.menuitem!["seatNumber"],
                  title: "Select Number of seats",
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Time",
                      style: Get.textTheme.bodyMedium!
                          .copyWith(color: AppColor.mono, fontSize: 16.sp),
                    ),
                    // Hours picker
                    const AppTimePicker(),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Date",
                      style: Get.textTheme.bodyMedium!
                          .copyWith(color: AppColor.mono, fontSize: 16.sp),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Obx(
                            () => Text(
                              selectedDate.value,
                              style: Get.textTheme.bodySmall!.copyWith(
                                  color: AppColor.mono, fontSize: 15.sp),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        GestureDetector(
                          onTap: _selectDate,
                          child: const Icon(Icons.calendar_today,
                              color: AppColor.mono),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Obx(
                  () => AppElevatedButton(
                    title: "CONFIRM",
                    width: double.maxFinite,
                    height: 45.h,
                    isValid: true,
                    isLoading: isLoading.value,
                    onPressed: confirmAndSaveBooking,
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          );
        });
  }
}
