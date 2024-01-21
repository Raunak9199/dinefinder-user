import 'package:dinefinder_user/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppSnackBar {
  AppSnackBar._();
  static SnackbarController showSnackbar({
    required String msg,
    String? titleText,
    int duration = 3,
  }) {
    return Get.rawSnackbar(
      titleText: Text(
        titleText ?? "",
        style: TextStyle(
          fontSize: (titleText == null || titleText == "") ? 0 : 14.sp,
          color: AppColor.monoWhite,
          fontWeight: FontWeight.w200,
        ),
      ),
      messageText: Text(
        msg,
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColor.monoWhite,
          fontWeight: FontWeight.w200,
        ),
      ),
      backgroundColor: AppColor.secondaryDark,
      duration: Duration(seconds: duration),
    );
  }
}
