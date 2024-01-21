import 'package:dinefinder_user/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TermsAndCond extends StatelessWidget {
  const TermsAndCond({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h)
          .copyWith(bottom: 15.h),
      child: SizedBox(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "aut_tc1".tr,
            style: Get.textTheme.bodySmall!.copyWith(color: AppColor.monoWhite),
            children: [
              TextSpan(
                // recognizer:,
                text: "aut_tc2".tr,
                style: Get.textTheme.bodySmall!.copyWith(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    color: AppColor.secondary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
