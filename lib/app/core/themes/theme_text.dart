import 'package:dinefinder_user/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle _headline1 = TextStyle(
  fontFamily: "Synonym",
  fontSize: 70.sp,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  color: AppColor.mono,
);

final TextStyle _headline2 = TextStyle(
  fontFamily: "Synonym",
  fontSize: 64.sp,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  color: AppColor.mono,
);

final TextStyle _headline3 = TextStyle(
  fontFamily: "Synonym",
  fontSize: 48.sp,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  color: AppColor.mono,
);

final TextStyle _subheading1 = TextStyle(
  fontFamily: "Synonym",
  fontSize: 36.sp,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  color: AppColor.mono,
);

final TextStyle _subheading2 = TextStyle(
  fontFamily: "Synonym",
  fontSize: 32.sp,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  color: AppColor.mono,
);
final TextStyle subheading3 = TextStyle(
  fontFamily: "Synonym",
  fontSize: 26.sp,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: AppColor.mono,
);

final TextStyle subheading4 = TextStyle(
  fontFamily: "Synonym",
  fontSize: 22.sp,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  color: AppColor.mono,
);

final TextStyle subheading5 = TextStyle(
  fontFamily: "Synonym",
  fontSize: 20.sp,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  color: AppColor.mono,
);

final TextStyle subheading6 = TextStyle(
  fontFamily: "Synonym",
  fontSize: 16.sp,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  color: AppColor.mono,
);

final TextStyle subheading7 = TextStyle(
  fontFamily: "Synonym",
  fontSize: 20.sp,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  color: AppColor.mono,
);
final TextStyle _bodyText1 = TextStyle(
  fontFamily: "Synonym",
  fontSize: 18.sp,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  //letterSpacing: 0.2,
  color: AppColor.mono,
);

final TextStyle _bodyText2 = TextStyle(
  fontFamily: "Synonym",
  fontSize: 22.sp,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  //letterSpacing: 1.0,
  color: AppColor.mono,
);

final TextStyle bodyText3 = TextStyle(
  fontFamily: "Synonym",
  fontSize: 14.sp,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  color: AppColor.mono,
);

final TextStyle _button = TextStyle(
  fontFamily: "Synonym",
  fontSize: 12.sp,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  letterSpacing: 1.5,
  color: AppColor.secondaryEmphasis,
);

final TextStyle _caption = TextStyle(
  fontFamily: "Synonym",
  fontSize: 12.sp,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
  color: AppColor.mono,
);

// final TextStyle _overLine = TextStyle(
//   fontSize: 10.sp,
//   fontStyle: FontStyle.normal,
//   fontWeight: FontWeight.w600,
//   letterSpacing: 0.2,
//   color: AppColor.blackTheme,
// );

// final TextStyle gilroy = TextStyle(
//   fontFamily: "Gilroy",
//   fontSize: 16.sp,
//   color: AppColor.darkBlue,
// );

TextTheme textTheme = GoogleFonts.openSansTextTheme(
  TextTheme(
    displayLarge: _headline1,
    displayMedium: _headline2,
    displaySmall: _headline3,
    titleMedium: _subheading1,
    titleSmall: _subheading2,
    bodyLarge: _bodyText1,
    bodyMedium: _bodyText2,
    labelLarge: _button,
    bodySmall: _caption,
  ),
);
