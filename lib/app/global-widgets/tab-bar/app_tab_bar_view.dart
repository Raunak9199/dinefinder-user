import 'package:dinefinder_user/app/core/themes/theme_color.dart';
import 'package:dinefinder_user/app/global-widgets/app_appbar.dart';
import 'package:dinefinder_user/app/global-widgets/app_scaffold.dart';
import 'package:dinefinder_user/app/global-widgets/tab-bar/tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppTabBarView extends GetView<TabBarController> {
  const AppTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: controller.tabIndex.value,
      length: controller.tabs.length,
      child: AppScaffold(
        onWillPop: controller.rootOnWillPop,
        scaffoldKey: controller.rootScaffoldKey,
        appBar: AppNewAppBar(
            height: 90.h,
            params: AppAppBarModel(
              title: "DineFinder",
              titleStyle: Get.textTheme.bodyMedium!
                  .copyWith(color: AppColor.monoWhite, fontSize: 25.sp),
              bottom: TabBar(
                onTap: (ind) => controller.handleTabSelection,
                tabs: [
                  Tab(
                    child: Text(
                      "My Menu",
                      style: Get.textTheme.bodyMedium!
                          .copyWith(color: AppColor.monoWhite, fontSize: 16.sp),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Profile",
                      style: Get.textTheme.bodyMedium!
                          .copyWith(color: AppColor.monoWhite, fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
            )),
        backgroundColor: AppColor.backgroundColor,
        body: TabBarView(
          children: controller.tabs,
        ),
      ),
    );
  }
}
