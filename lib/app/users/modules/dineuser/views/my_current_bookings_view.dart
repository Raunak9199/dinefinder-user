import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/controllers/my_existing_booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyCurrentBookingsView extends GetView<MyCurrentBookingController> {
  const MyCurrentBookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondaryEmphasis,
        iconTheme: const IconThemeData(color: AppColor.monoWhite),
        title: Text(
          'My Bookings',
          style: Get.textTheme.bodySmall!.copyWith(
            color: AppColor.monoWhite,
            fontSize: 17.sp,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const CircularProgressIndicator();
        } else if (controller.bookings.isNotEmpty) {
          return Padding(
            padding: EdgeInsets.only(
                top: 15.h, bottom: 15.h, left: 15.w, right: 15.w),
            child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemCount: controller.bookings.length,
                itemBuilder: (context, index) {
                  final booking = controller.bookings[index];
                  return Dismissible(
                    key: Key(booking.bookingId!),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 28.h,
                          ),
                        ),
                      ),
                    ),
                    confirmDismiss: (direction) async {
                      return await Get.dialog(
                        SizedBox(
                          height: 200.h,
                          width: double.maxFinite,
                          child: AlertDialog(
                            backgroundColor: AppColor.monoWhite,
                            title: Text(
                              'Confirm Deletion',
                              style: Get.textTheme.bodySmall!.copyWith(
                                color: AppColor.mono,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text(
                              'Do you really want to cancel this booking?',
                              style: Get.textTheme.bodySmall!.copyWith(
                                color: AppColor.mono,
                                fontSize: 15.sp,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  'No',
                                  style: Get.textTheme.bodySmall!.copyWith(
                                    color: AppColor.mono,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                onPressed: () {
                                  Get.back(result: false);
                                },
                              ),
                              TextButton(
                                child: Text(
                                  'Yes',
                                  style: Get.textTheme.bodySmall!.copyWith(
                                    color: AppColor.mono,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                onPressed: () {
                                  Get.back(result: true);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    onDismissed: (direction) async {
                      await controller.deleteBooking(
                        booking.bookingId!,
                        booking.sellerUid!,
                      );

                      controller.bookings.removeAt(index);
                    },
                    child: bookingList(
                      booking.user?.name ?? AuthUtils.signUpUserData!.name!,
                      booking.bookingId!.substring(0, 11),
                      booking.date!,
                      booking.time!,
                      booking.sellerLoc!,
                      booking.numberOfTable!,
                      booking.numberOfSeat!,
                      booking.sellername!,
                    ),
                  );
                }),
          );
        } else {
          return Center(
            child: Text(
              "No bookings found",
              style: Get.textTheme.bodySmall!.copyWith(
                color: AppColor.monoWhite,
                fontSize: 17.sp,
              ),
            ),
          );
        }
      }),
    );
  }

  bookingList(
    String name,
    String bookingId,
    String date,
    String time,
    String location,
    String table,
    String seat,
    String sellername,
  ) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColor.monoWhite,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Name: ",
                style: Get.textTheme.bodySmall!.copyWith(
                  color: AppColor.mono,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                name,
                style: Get.textTheme.bodySmall!.copyWith(
                  color: AppColor.mono,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          TextWidget(title: "Booking Id: ", value: bookingId),
          TextWidget(title: "Restaurant name: ", value: sellername),
          TextWidget(title: "Restaurant location: ", value: location),
          TextWidget(title: "Date: ", value: date),
          TextWidget(title: "Time: ", value: time),
          TextWidget(title: "Total table: ", value: table),
          TextWidget(title: "Total seat per table: ", value: seat),
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.visible,
      textAlign: TextAlign.start,
      softWrap: true,
      text: TextSpan(
        style: Get.textTheme.bodySmall!.copyWith(
          color: AppColor.mono,
          fontSize: 15.sp,
        ),
        children: [
          TextSpan(text: "$title "),
          TextSpan(text: value),
        ],
      ),
    );
  }
}
