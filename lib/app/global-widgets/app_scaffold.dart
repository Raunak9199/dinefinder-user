import 'package:dinefinder_user/app/global-widgets/app_appbar.dart';
import 'package:dinefinder_user/app/global-widgets/app_dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../core/core.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.scaffoldKey,
    this.drawer,
    this.isConfirmExit = false,
    this.isConfirmLogOut = false,
    this.backgroundColor,
    required this.body,
    this.appBar,
    this.onWillPop,
    this.resizeToAvoidBottomInset = false,
    this.floatingActionButtonLocation =
        FloatingActionButtonLocation.centerFloat,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.withBackground = true,
    this.withScrollable = false,
  });
  final Key? scaffoldKey;
  final bool isConfirmExit;
  final bool isConfirmLogOut;
  final Color? backgroundColor;
  final Widget? body;
  final AppNewAppBar? appBar;
  final Future<bool> Function()? onWillPop;
  final bool? resizeToAvoidBottomInset;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final bool withBackground;
  final bool withScrollable;

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: onWillPop ??
            () {
              if (isConfirmExit) {
                openAppDialog(
                  params: OpenDialogModel(
                    title: "aut_exitAppStr".tr,
                    subTitle: "aut_areYouSureQuitStr".tr,
                  ),
                );
              } else if (isConfirmLogOut) {
                openAppDialog(
                  params: OpenDialogModel(
                    title: "aut_confirmLogOutStr".tr,
                    subTitle: "aut_logOutMsgStr".tr,
                    onConfirm: () async => AuthUtils.clearData(),
                  ),
                );
              }
              return Future.value(true);
            },
        child: Scaffold(
          key: scaffoldKey,
          drawer: drawer,
          backgroundColor: backgroundColor ?? AppColor.monoWhite,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          appBar: appBar,
          body: body,
        ),
      );
}
