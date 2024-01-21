import 'package:dinefinder_user/app/core/routes/app_navigation.dart';
import 'package:dinefinder_user/app/global-widgets/app_dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Widget> tabs = [
    // const DineuserView(),
    const Scaffold(),
  ].obs;

  final rootScaffoldKey = GlobalKey<ScaffoldState>();
  var tabIndex = 0.obs;

  late TabController tabController;

  @override
  Future<void> onInit() async {
    tabController = TabController(vsync: this, length: tabs.length);
    super.onInit();
  }

  void handleTabSelection() {
    tabIndex.value = tabController.index;
  }

  Future<bool> rootOnWillPop() {
    if (rootScaffoldKey.currentState?.isDrawerOpen ?? false) {
      Nav.pop();
      return Future.value(false);
    } else if (tabIndex.value != 0 || tabController.index != 0) {
      tabIndex.value = 0;
      tabController.index = 0;
      return Future.value(false);
    } else {
      openAppDialog(
        params: OpenDialogModel(
          title: "aut_exitAppStr".tr,
          subTitle: "aut_areYouSureQuitStr".tr,
        ),
      );
      return Future.value(true);
    }
  }
}
