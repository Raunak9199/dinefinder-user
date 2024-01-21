import 'dart:developer';

import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/global-widgets/app_elevated_button.dart';
import 'package:dinefinder_user/app/global-widgets/app_image.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/controllers/booking_controller.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/controllers/detailed_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailedView extends GetView<BookingController> {
  const DetailedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final detailController = Get.find<DetailedMenuController>();
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.monoWhite),
        title: const Text(
          'Menus',
          style: TextStyle(color: AppColor.monoWhite),
        ),
        backgroundColor: AppColor.secondaryDark,
      ),
      // resizeToAvoidBottomInset: true,
      bottomNavigationBar: InkWell(
        onTap: () {
          log("sheet opened");
          controller.openBookingMenuSheet();
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
          decoration: BoxDecoration(
              color: AppColor.secondaryDark,
              borderRadius: BorderRadius.circular(25.r)),
          child: AppElevatedButton(
            title: "Book Table",
            width: double.maxFinite,
            color: AppColor.secondaryDark,
            height: 48.h,
            // onPressed: () {
            //   log("sheet opened");
            //   controller.openBookingMenuSheet();
            // },
          ),
        ),
      ),
      body: Obx(() {
        final snapshot = detailController.menus.value;
        if (snapshot == null) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.docs.isEmpty) {
          return Center(
            child: Text(
              "No menu available",
              style: Get.textTheme.bodySmall!.copyWith(
                color: AppColor.monoWhite,
                fontSize: 18.sp,
              ),
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: ListView.builder(
            itemCount: snapshot.docs.length,
            itemBuilder: (context, index) {
              final item = snapshot.docs[index];
              return menuWidgetCard(
                desc: item['desc'],
                menuTitle: item['menuTitle'],
                posturl: item['posturl'],
              );
            },
          ),
        );
      }),
    );
  }

  menuWidgetCard({
    String? desc,
    String? menuTitle,
    String? posturl,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: ProfileImageDisplay(
                    height: 20.w, width: 20.w, imgUrl: posturl),
              ),
              SizedBox(width: 10.w),
              Text(
                menuTitle ?? "Restaurant...",
                style: Get.textTheme.bodyLarge!.copyWith(
                  color: AppColor.monoWhite,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        Container(
          height: 350.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: ProfileImageDisplay(
            width: double.maxFinite,
            fit: BoxFit.cover,
            imgUrl: posturl,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Text(
            desc ?? "",
            style: Get.textTheme.bodyLarge!.copyWith(
              color: Colors.white70,
              fontSize: 16.sp,
            ),
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
