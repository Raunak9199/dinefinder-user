/* import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/global-widgets/app_scaffold.dart';
import 'package:dinefinder_user/app/global-widgets/bottom-nav/bottom_nav_bar_controller.dart';
import 'package:dinefinder_user/app/global-widgets/bottom-nav/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavIndexPage extends GetView<BottomNavBarController> {
  const BottomNavIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      onWillPop: controller.rootOnWillPop,
      scaffoldKey: controller.rootScaffoldKey,
      backgroundColor: AppColor.backgroundColor,
      bottomNavigationBar: BottomNavigationBarWidget(controller: controller),
      body: Obx(
        () => controller.screenList[controller.tabIndex.value],
      ),
    );
  }
}
 */
