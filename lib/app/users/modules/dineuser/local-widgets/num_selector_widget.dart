import 'dart:developer';

import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/controllers/booking_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NumberSelectorWidget extends GetView<BookingController> {
  const NumberSelectorWidget({
    super.key,
    required this.item,
    required this.title,
  });
  final String item;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Get.textTheme.bodyMedium!
              .copyWith(color: AppColor.mono, fontSize: 16.sp),
        ),
        SizedBox(
          width: 80.w,
          child: CupertinoPicker(
            itemExtent: 40.sp,
            onSelectedItemChanged: (int index) {
              log('Selected number: ${index + 1}');
              controller.selectednum.value = index + 1;
            },
            children: List<Widget>.generate(
              int.parse(
                item,
              ),
              (int index) {
                return Center(
                  child: Text('${index + 1}'),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class SeatSelectorWidget extends GetView<BookingController> {
  const SeatSelectorWidget({
    super.key,
    required this.item,
    required this.title,
  });
  final String item;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Get.textTheme.bodyMedium!
              .copyWith(color: AppColor.mono, fontSize: 16.sp),
        ),
        SizedBox(
          width: 80.w,
          child: CupertinoPicker(
            itemExtent: 40.sp,
            onSelectedItemChanged: (int index) {
              log('Selected number: ${index + 1}');
              controller.selectedseatNum.value = index + 1;
            },
            children: List<Widget>.generate(
              int.parse(
                item,
              ),
              (int index) {
                return Center(
                  child: Text('${index + 1}'),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
