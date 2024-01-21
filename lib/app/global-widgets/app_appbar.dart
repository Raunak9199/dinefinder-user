import 'package:dinefinder_user/app/global-widgets/bottom-nav/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/core.dart';

class AppAppBarModel {
  final String? title;
  final Widget? titleInWidget;
  final String? subtitle;
  final Widget? leading;
  final List<Widget>? actions;
  final bool isBack;
  final bool centerTitle;
  final bool isIosBack;
  final bool isDrawer;
  final Color backgroundColor;
  final double? elevation;
  final void Function()? customPop;
  final PreferredSizeWidget? bottom;
  final bool automaticallyImplyLeading;
  final TextStyle? titleStyle;
  final Color iconTitleColor;
  final ShapeBorder? shape;
  final EdgeInsets? titlePadding;

  AppAppBarModel({
    this.title,
    this.titleInWidget,
    this.subtitle,
    this.leading,
    this.actions,
    this.backgroundColor = AppColor.secondaryDark,
    this.customPop,
    this.elevation = 0.2,
    this.bottom,
    this.isBack = false,
    this.centerTitle = false,
    this.isIosBack = false,
    this.isDrawer = false,
    this.automaticallyImplyLeading = false,
    this.titleStyle,
    this.iconTitleColor = AppColor.monoWhite,
    this.shape,
    this.titlePadding,
  });
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.params});

  final AppAppBarModel params;

  @override
  Widget build(BuildContext context) {
    if (params.title?.isNotEmpty ?? false) {
      return Padding(
        padding: params.titlePadding ?? EdgeInsets.zero,
        child: Text(
          params.title!,
          textAlign: TextAlign.left,
          style: params.titleStyle ??
              Get.textTheme.titleMedium?.copyWith(
                color: params.iconTitleColor,
              ),
          /* Get.textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w600,
                color: params.iconTitleColor,
              ), */
        ),
      );
    } else if (params.titleInWidget != null) {
      return params.titleInWidget!;
    }
    return const SizedBox.shrink();
  }
}

class AppNewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppNewAppBar(
      {super.key, required this.params, this.height, this.shape});
  final AppAppBarModel params;
  final double? height;
  final ShapeBorder? shape;

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
        automaticallyImplyLeading: params.automaticallyImplyLeading,
        elevation: params.elevation,
        centerTitle: params.centerTitle,
        backgroundColor: params.backgroundColor,
        shape: params.shape,
        /*  ?? AppColor.whiteBase, */
        bottom: params.bottom,
        titleSpacing: params.isBack ? 0 : null,
        // leadingWidth: 51.w,
        leading: (params.leading == null)
            ? params.isDrawer
                ? GestureDetector(
                    onTap: () => Get.find<BottomNavBarController>()
                        .rootScaffoldKey
                        .currentState
                        ?.openDrawer(),
                    child: Transform.scale(
                      scale: 0.35,
                      child: const Icon(Icons.menu),
                      // child: const AppImage(ImagePaths.burgerMenu),
                    ),
                  )
                : params.isBack
                    ? (params.customPop == null)
                        ? IconButton(
                            onPressed: Nav.pop,
                            padding: EdgeInsets.zero,
                            icon: params.isIosBack
                                ? Padding(
                                    padding: EdgeInsets.only(left: 18.w),
                                    child: const Icon(Icons.arrow_back_ios_new))
                                : Padding(
                                    padding: EdgeInsets.only(left: 18.w),
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: AppColor.monoWhite,
                                    )),
                          )
                        : IconButton(
                            onPressed: params.customPop,
                            padding: EdgeInsets.zero,
                            icon: params.isIosBack
                                ? Padding(
                                    padding: EdgeInsets.only(left: 18.w),
                                    child: const Icon(Icons.arrow_back_ios_new))
                                : Padding(
                                    padding: EdgeInsets.only(left: 18.w),
                                    child: const Icon(Icons.arrow_back)),
                          )
                    : null
            : params.leading,
        title: params.subtitle == null
            ? TitleWidget(params: params)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  TitleWidget(params: params),
                  Text(
                    params.subtitle!,
                    style: Get.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color:
                          params.iconTitleColor, /*  ?? AppColor.greyMedium, */
                    ),
                  ),
                ],
              ),
        actions: params.actions,
      );
}
