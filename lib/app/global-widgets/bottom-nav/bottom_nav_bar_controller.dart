import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/global-widgets/app_dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  final rootScaffoldKey = GlobalKey<ScaffoldState>();
  var tabIndex = 0.obs;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    subTitleController.dispose();
    super.dispose();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  final List<Widget> screenList = [
    // const HomeView(),
    // const Scaffold(
    //   body: Center(
    //     child: Text("Chat"),
    //   ),
    // ),
    // const ProfileView(),
  ];
  Future<bool> rootOnWillPop() {
    if (rootScaffoldKey.currentState?.isDrawerOpen ?? false) {
      Nav.pop();
      return Future.value(false);
    } else if (tabIndex.value != 0) {
      tabIndex.value = 0;
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
