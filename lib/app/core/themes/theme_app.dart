import 'package:dinefinder_user/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final radius = Radius.circular(6.r);

final _borderStyle = UnderlineInputBorder(
  borderRadius: BorderRadius.only(
    topLeft: radius,
    topRight: radius,
  ),
  borderSide: const BorderSide(color: AppColor.monoAlt, width: 0.8),
);

final _focusedBorderStyle = UnderlineInputBorder(
  borderRadius: BorderRadius.only(
    topLeft: radius,
    topRight: radius,
  ),
);

final _errorBorder = UnderlineInputBorder(
  borderRadius: BorderRadius.only(
    topLeft: radius,
    topRight: radius,
  ),
  borderSide: const BorderSide(color: AppColor.secondary),
);

final myTheme = ThemeData(
  fontFamily: "Synonym",
  dividerColor: Colors.transparent,
  primaryColor: AppColor.secondaryDark,
  textTheme: textTheme,
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: AppColor.secondaryDark,
    hintStyle: Get.textTheme.bodyMedium?.copyWith(
      color: AppColor.monoFade,
      fontWeight: FontWeight.normal,
    ),
    labelStyle: Get.textTheme.bodyMedium?.copyWith(
      color: AppColor.monoFade,
      fontWeight: FontWeight.normal,
    ),
    border: _borderStyle,
    enabledBorder: _borderStyle,
    focusedBorder: _focusedBorderStyle,
    errorBorder: _errorBorder,
    disabledBorder: _borderStyle,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColor.secondaryEmphasis,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: AppColor.generateMaterialColor(AppColor.secondaryDark),
  ).copyWith(error: AppColor.secondary),
);
