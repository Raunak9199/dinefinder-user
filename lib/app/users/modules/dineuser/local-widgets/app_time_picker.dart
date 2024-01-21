import 'dart:developer';

import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/controllers/detailed_menu_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppTimePicker extends GetView<DetailedMenuController> {
  const AppTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Hours picker
        SizedBox(
          width: 70.w,
          child: CupertinoPicker(
            itemExtent: 40.0,
            onSelectedItemChanged: (int index) {
              int selectedHour = 9 + index;
              log('Selected hour: $selectedHour');
              controller.hrs.value = selectedHour;
            },
            children: List<Widget>.generate(15, (int index) {
              int hour = 9 + index;
              return Center(child: Text(hour.toString().padLeft(2, '0')));
            }),
          ),
        ),
        Text(":", style: TextStyle(fontSize: 20.sp, color: AppColor.mono)),

        // Minutes picker
        SizedBox(
          width: 70.sp,
          child: CupertinoPicker(
            itemExtent: 40.0,
            onSelectedItemChanged: (int index) {
              log('Selected minute: $index');
              controller.min.value = index;
            },
            children: List<Widget>.generate(60, (int index) {
              return Center(child: Text(index.toString().padLeft(2, '0')));
            }),
          ),
        ),
        Obx(() {
          return Text(
            controller.hrs.value < 12 ? "AM" : "PM",
            style: TextStyle(fontSize: 15.sp, color: AppColor.mono),
          );
        }),
      ],
    );
  }
}
