import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/global-widgets/bottom-nav/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BottomNavBarController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          backgroundColor: AppColor.monoEmphasis,
          unselectedItemColor: AppColor.monoWhite,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Icon(Icons.home),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Icon(Icons.message),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Icon(Icons.person_2_outlined),
                ),
                label: ""),
          ],
          onTap: (int value) => controller.changeTabIndex(value),
        ));
  }
}
