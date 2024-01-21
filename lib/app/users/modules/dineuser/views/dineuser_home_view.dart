import 'dart:developer';

import 'package:dinefinder_user/app/core/routes/app_navigation.dart';
import 'package:dinefinder_user/app/core/routes/app_pages.dart';
import 'package:dinefinder_user/app/core/themes/theme_color.dart';
import 'package:dinefinder_user/app/global-widgets/app_elevated_button.dart';
import 'package:dinefinder_user/app/global-widgets/app_image.dart';
import 'package:dinefinder_user/app/global-widgets/app_snackbar.dart';
import 'package:dinefinder_user/app/users/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/controllers/dineuser_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DineUserPage extends GetView<DineuserController> {
  const DineUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'DineFinder',
          style: TextStyle(color: AppColor.monoWhite),
        ),
        backgroundColor: AppColor.secondaryEmphasis,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Nav.pushNamed(Routes.bookingView);
            },
            icon: const Icon(
              Icons.bookmark,
              color: AppColor.monoWhite,
            ),
            tooltip: "My Bookings",
          ),
          IconButton(
            onPressed: () {
              Get.find<AuthRepositoryInterface>().logout();
              AppSnackBar.showSnackbar(msg: "Logged out. Successfully!");
              Nav.pushAndRemoveUntilNamed(Routes.loginview);
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: AppColor.monoWhite,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          final snapshot = controller.sellerRestaurantStreamRx.value;
          if (snapshot == null || snapshot.docs.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: ListView.separated(
              separatorBuilder: (_, __) => SizedBox(height: 10.h),
              itemCount: snapshot.docs.length,
              itemBuilder: (context, index) {
                final item = snapshot.docs[index];
                return menuWidgetCard(
                  location: item['location'],
                  onPressed: () {
                    log("Clicked");
                    // controller.fetchMenus(item['userUid']);
                    Nav.pushNamed(Routes.detailedView, arguments: item);
                  },
                  profUrl: item['profUrl'],
                  sellername: item["name"],
                  table: item["tableNumber"] == 0
                      ? "No table available"
                      : item["tableNumber"],
                  seat: item["seatNumber"] == 0
                      ? "No seat available"
                      : item["seatNumber"],
                );
              },
            ),
          );
        }),
      ),
    );
  }

  menuWidgetCard({
    String? location,
    String? profUrl,
    String? sellername,
    void Function()? onPressed,
    String? table,
    String? seat,
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
                  height: 20.w,
                  width: 20.w,
                  imgUrl: profUrl,
                ),
              ),
              SizedBox(width: 10.w),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  "@$sellername",
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: AppColor.monoWhite,
                    fontSize: 16.sp,
                  ),
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
            // color: Colors.red,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: ProfileImageDisplay(
            // height: 250.h,
            width: double.maxFinite,
            fit: BoxFit.cover,
            imgUrl: profUrl,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w).copyWith(top: 10.h),
          child: Text(
            location ?? "",
            style: Get.textTheme.bodyLarge!.copyWith(
              color: Colors.white70,
              fontSize: 16.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h)
              .copyWith(bottom: 5.h),
          child: Text(
            "$table tables",
            style: Get.textTheme.bodyLarge!.copyWith(
              color: Colors.white70,
              fontSize: 16.sp,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h)
              .copyWith(top: 0),
          child: Text(
            "$seat seats per table",
            style: Get.textTheme.bodyLarge!.copyWith(
              color: Colors.white70,
              fontSize: 16.sp,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: AppElevatedButton(
            title: "CheckOut",
            isValid: true,
            height: 48.h,
            width: double.maxFinite,
            onPressed: onPressed,
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
